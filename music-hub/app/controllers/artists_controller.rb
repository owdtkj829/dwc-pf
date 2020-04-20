class ArtistsController < ApplicationController
	before_action :authenticate_user!,except:[:index]

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
      @artists =  params[:search].present? ? Artist.artist_serach(params[:search]) :  Artist.none
	end

	private
	def artist_params
    	params.require(:artist).permit(:name, :explanation, :image)
	end
end
