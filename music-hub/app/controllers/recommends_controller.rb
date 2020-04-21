class RecommendsController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = current_user.id
		@artist = Artist.find(params[:artist_id])
		@recommends = Recommend.where(artist_id: @artist.id)
		@recommend = Recommend.new
	end

	def show
		@recommend = Recommend.find(params[:id])
		@artist = Artist.find(params[:artist_id])
		@comment = Comment.new
		@comments = Comment.where(recommend_id: @recommend.id)
	end

	def create
		@recommend = Recommend.new(recommend_params)
		@recommend.user_id = current_user.id
		@artist = Artist.find(params[:artist_id])
		@recommend.artist_id = @artist.id
		@url = params[:recommend][:url]
    	url = @url.last(11)
    	@recommend.url = url
		@recommend.save
	    redirect_back(fallback_location: root_path)
	end

	def destroy
		@recommend = Recommend.find(params[:id])
		@recommend.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def recommend_params
		params.require(:recommend).permit(:artistname, :song, :url, :explanation)
	end
end
