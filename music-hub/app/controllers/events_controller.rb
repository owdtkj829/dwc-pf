class EventsController < ApplicationController

	def index
		@event = Event.where(artist_id: params[:artist_id])
		@artist = Artist.find(params[:artist_id])
	end

	def show
		@event = Event.new
		@events = Event.where(artist_id: params[:id])
		@artist = Artist.find(params[:id])
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		@event_artist = Artist.find(params[:artist_event][:id])
		@event.artist_id = @event_artist.id
	  	respond_to do |format|
	         @event.save
	  	      format.html { redirect_to user_path(current_user.id)}
	          format.json { render :events , status: :created, location: @event }
    	end
	end

	def destroy
		@event = Event.find(params[:id])
    	@event.destroy
    	redirect_to user_path(current_user)
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		redirect_to user_path(current_user)
	end

	#ユーザー用のカレンダー
  	def user_index
  		@event = Event.new
  		@user = User.find(current_user.id)
  		@favorites = Favorite.where(user_id: current_user.id)
		@events = Event.where(user_id: current_user.id)
 	end

  	#ユーザー用カレンダーの詳細
  	def user_show

    end

    def events
    	@event = Event.where(user_id: current_user.id)
    	# render :json => @event
	    respond_to do |format|
	      format.json {
	        render json:
	        @event.to_json(
	          only: [:artist_id, :venue, :start, :finish, :share, :url, :memo]
	        )
	      }
	   	end
    end

    def event
    	@event = Event.where(artist_id: params[:artist_id])
	    respond_to do |format|
	      format.json {
	        render json:
	        @event.to_json(
	          only: [:artist_id, :venue, :start, :finish, :share, :url, :memo]
	        )
	      }
	   	end
    end

	private
	def favorite_params
    	params.require(:artist_event).permit(:id)
  	end
	def event_params
		params.require(:event).permit(:artist_id, :venue, :start, :finish, :share, :url, :memo)
	end
end
