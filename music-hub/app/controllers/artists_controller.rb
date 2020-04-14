class ArtistsController < ApplicationController
	
	def index
		@artists = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
		@user = current_user
		@schedules = Schedule.where(artist_id: params[:id])
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
		@artist.save
		redirect_to artists_path
	end

	def update
		@artist = Artist.find(params[:id])
	    @artist.update(artist_params)
    	redirect_to artist_path(params[:id])
	end

	def destroy
		@artist = Artist.find(params[:id])
    	@artist.destroy
    	redirect_to root_path
	end

	def search
	end

	def time
	end

	private
	def artist_params
    	params.require(:artist).permit(:name, :explanation, :image)
	end
end
