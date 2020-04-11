class ArtistsController < ApplicationController
	
	def index
		@artists = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
		@user = current_user
	end

	def new
		@artist = Artist.new
	end

	def edit
	end

	def create
		@artist = Artist.new(artist_params)
		@artist.user_id = current_user.id
		@artist.save
		redirect_to artists_path
	end

	def update
	end

	def destroy
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
