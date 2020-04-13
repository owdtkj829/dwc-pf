class UsersController < ApplicationController
  def show
  	@schedule = Schedule.new
    @favorite = Favorite.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @schedules = Schedule.where(user_id: current_user.id)
    @schedule = Schedule.new
    
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

  private
  def user_params
    params.require(:user).permit(:name, :image, :userid, :email)
  end
end
