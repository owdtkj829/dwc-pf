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
		params[:user_id] = @recommend.user_id
		@user = User.find(params[:user_id])
		@artist = Artist.find(params[:artist_id])
		@comment = Comment.new
		@comments = Comment.where(recommend_id: @recommend.id)
	end

	def create
		@recommend = Recommend.new(recommend_params)
		@recommend.user_id = current_user.id
		@recommend.artist_id = params[:artist_id]
		@url = params[:recommend][:url]
    	url = @url.last(11)
    	@recommend.url = url
		if @recommend.save
	       redirect_back(fallback_location: root_path)
    	else
	       render :index
    	end
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
