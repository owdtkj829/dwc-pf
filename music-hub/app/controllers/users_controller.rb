class UsersController < ApplicationController
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

  
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction, :email)
  end
end
