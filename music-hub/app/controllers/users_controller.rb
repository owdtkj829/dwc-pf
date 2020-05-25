class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  	@event = Event.new
    @favorites = Favorite.where(user_id: params[:id])
    @user = User.find(params[:id])
    @myrecommends = Myrecommend.where(user_id: params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to user_path(current_user)
    else
       flash[:user_error] = "全て入力してください。また、ユーザー名20文字以内・自己紹介150文字以内で入力をお願いします。"
       redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to root_path
  end

  def favorite
    @favorites = Favorite.where(user_id: params[:id])
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
