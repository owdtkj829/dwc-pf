class EventsController < ApplicationController
	before_action :correct_user, only: [:user_index]
	before_action :authenticate_user!

	#アーティストページ
	def index
		@events = Event.where(artist_id: params[:artist_id])
		@artist = Artist.find(params[:artist_id])
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		@event_artist = Artist.find(params[:artist_event][:id])
		@event.artist_id = @event_artist.id
	  	if @event.save
		   respond_to do |format|
		  	 format.html { redirect_back(fallback_location: root_path)}
		     format.json { render :events , status: :created, location: @events }
	       end
	    else
	       flash[:event_error] = "全て入力してください。また、タイトル20文字以内・会場30文字以内、メモ150文字以内、終了日は開始日以降で入力をお願いします。"
           redirect_back(fallback_location: root_path)
	    end
	end

	def destroy
		@event = Event.find(params[:id])
	    @event.destroy
	    respond_to do |format|
	    	format.html { redirect_back(fallback_location: root_path)}
	        format.json { render :events , location: @events }
    	end
	end

	def update
		@event = Event.find(params[:id])
		@event.user_id = current_user.id
        if @event.update(event_params)
           redirect_back(fallback_location: root_path)
       	else
       	   flash[:event_error] = "全て入力してください。また、タイトル20文字以内・会場30文字以内、メモ150文字以内で入力をお願いします。"
           redirect_back(fallback_location: root_path)
       	end
	end

	#ユーザーページ
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
	          only: [:id, :user_id, :title, :artist_id, :venue, :start, :end, :memo, :share]
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
	          only: [:id, :user_id, :title, :artist_id, :venue, :start, :end, :memo, :share]
	        )
	      }
	   	end
    end

	private
	def favorite_params
    	params.require(:artist_event).permit(:id)
  	end
	def event_params
		params.require(:event).permit(:artist_id, :title, :venue, :start, :end,:share, :url, :memo )
	end
	#URL直打ち防止
	def correct_user
	    @user = User.find(params[:user_id])
	    redirect_to root_path unless @user == current_user
	end
end
