class UsersController < ApplicationController
  def show
  	@schedule = Schedule.new
    @favorites = Favorite.where(user_id: current_user.id)
    @user = User.find(params[:id])
    @schedules = Schedule.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  	
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
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction, :email)
  end
end
