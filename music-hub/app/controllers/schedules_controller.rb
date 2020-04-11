class SchedulesController < ApplicationController
	
	def index
		
	end

	def show
		
	end

	def create
		@schedule = Schedule.new(schedule_params)
		@schedule.user_id = current_user.id
		@schedule_artist = Artist.find(params[:artist_schedule][:id])
		@schedule.artist_id = @schedule_artist.id
    	@schedule.save!
    	redirect_back(fallback_location: root_path)
	end
	

	def destroy
		
	end

	def update
		
	end

	private
	def favorite_params
    	params.require(:artist_schedule).permit(:id)
  	end
	def schedule_params
		params.require(:schedule).permit(:artist_id, :venue, :start, :finish, :share, :url, :mamo)
	end
end
