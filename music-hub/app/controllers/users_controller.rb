class UsersController < ApplicationController
  def show
  	@schedule = Schedule.new
    @favorite = Favorite.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @schedules = Schedule.where(user_id: current_user.id)
    @schedule = Schedule.new
    
  end

  def create
  	
  end

  def update
  end

  def destroy
  end
end
