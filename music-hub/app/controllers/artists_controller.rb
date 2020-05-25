class ArtistsController < ApplicationController
	before_action :authenticate_user!,  only:[:index]
	before_action :correct_user, only: [:edit, :update, :destroy]]

	def index
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def create
		@artist = Artist.new(artist_params)
		@artist.user_id = current_user.id
		if @artist.save
		   redirect_to artists_path
		else
		   flash[:artist_error] = "全て入力してください。また、アーティスト名20文字以内・アーティスト情報150文字以内で入力をお願いします。"
	   	   redirect_back(fallback_location: root_path)
	   	end
	end

	def update
		@artist = Artist.find(params[:id])
	    @artist.update(artist_params)
    	redirect_to artist_events_path(params[:id])
	end

	def destroy
		@artist = Artist.find(params[:id])
    	@artist.destroy
    	redirect_to root_path
	end

	def search
      @artists =  params[:search].present? ? Artist.artist_serach(params[:search]) :  Artist.none
	end

	private
	def artist_params
    	params.require(:artist).permit(:name, :explanation, :image)
	end
	#URL直打ち防止
  	def correct_user
   		@artist = Artist.find(params[:id])
   		redirect_to root_path unless @artist.user_id == current_user.id
 	end
end
