class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  before_action :authenticate_user!
  
  def show
  	@event = Event.new
    @favorites = Favorite.where(user_id: current_user.id)
    @user = User.find(params[:id])
    @events = Event.where(user_id: current_user.id)
    @artists = Artist.where(user_id: params[:id])
    @myrecommends = Myrecommend.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def favorite
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def myrecommend
    @myrecommends = Myrecommend.where(user_id: params[:id])
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction, :email)
  end

  #URL直打ち防止
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end
end
