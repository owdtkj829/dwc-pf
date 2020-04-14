class SchedulesController < ApplicationController
	
	def index
		@schedules = Schedule.where(artist_id: params[:artist_id])
		@artist = Artist.find(params[:artist_id])
	end

	def show
		@schedule
		@schedules = Schedule.where(artist_id: params[:artist_id])
		@artist = Artist.find(params[:artist_id])
	end

	def create
		@schedule = Schedule.new(schedule_params)
		@schedule.user_id = current_user.id
		@schedule_artist = Artist.find(params[:artist_schedule][:id])
		@schedule.artist_id = @schedule_artist.id
    	respond_to do |format|
	      if @schedule.save!
	        format.html { redirect_to user_path(current_user), notice: 'Event was successfully created.' }
	        format.json { redirect_to user_path(current_user), status: :created, location: @schedule }
	      else
	        format.html { redirect_to user_path(current_user) }
	        format.json { render json: @schedule.errors, status: :unprocessable_entity }
	      end
	  	end
    	#redirect_back(fallback_location: root_path)
	end
	

	def destroy
		@schedule = Schedule.find(params[:id])
    	@schedule.destroy
    	redirect_to user_path(current_user)
	end

	def update
		@schedule = Schedule.find(params[:id])
		@schedule.update(schedule_params)
		redirect_to user_path(current_user)
	end

	private
	def favorite_params
    	params.require(:artist_schedule).permit(:id)
  	end
	def schedule_params
		params.require(:schedule).permit(:artist_id, :venue, :start, :finish, :share, :url, :memo)
	end
end
