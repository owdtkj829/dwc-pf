class EventsController < ApplicationController
	#アーティスト用のカレンダー
	def index
		@event = Event.where(artist_id: params[:artist_id])
		@artist = Artist.find(params[:artist_id])
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		@event_artist = Artist.find(params[:artist_event][:id])
		@event.artist_id = @event_artist.id
	  	respond_to do |format|
	         @event.save
	  	      format.html { redirect_back(fallback_location: root_path)}
	          format.json { render :events , status: :created, location: @events }
    	end
	end

	def destroy
		@event = Event.find(params[:id])
    	@event.destroy
    	redirect_to user_path(current_user)
	end

	def update
		event = Event.find(params[:id])
        @events = Event.where(user_id: current_user.id)
        event.update(event_params)
	end

	#ユーザー用のカレンダー
  	def user_index
  		@event = Event.new
  		@user = User.find(params[:user_id])
  		@favorites = Favorite.where(user_id: current_user.id)
		@events = Event.where(user_id: params[:user_id])
 	end

    #ユーザーページのカレンダー表示
    def events
    	@events = Event.where(user_id: params[:user_id])
    	# render :json => @event
	    respond_to do |format|
	      format.json {
	        render json:
	        @events.to_json(
	          only: [:artist_id, :venue, :start, :finish, :memo]
	        )
	      }
	   	end
    end

    #アーティストページのカレンダー表示
    def event
    	@event = Event.where(artist_id: params[:artist_id],share: 0)
	    respond_to do |format|
	      format.json {
	        render json:
	        @event.to_json(
	          only: [:artist_id, :venue, :start, :finish,  :memo, :share]
	        )
	      }
	   	end
    end

	private
	def favorite_params
    	params.require(:artist_event).permit(:id)
  	end
	def event_params
		params.require(:event).permit(:venue, :start, :finish, :share, :url, :memo)
	end
end
