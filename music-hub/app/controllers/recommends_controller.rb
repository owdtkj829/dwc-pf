class RecommendsController < ApplicationController
	def index
		@recommends = Recommend.all
		@recommend = Recommend.new
		@artist = Artist.find(params[:artist_id])
	end

	def show
		@artist = Artist.find(params[:artist_id])
		@recommend = Recommend.find(params[:id])
		@comment = Comment.new
		@comments = Comment.where(recommend_id: @recommend.id)
	end

	def create
		@recommend = Recommend.new(recommend_params)
		@recommend.user_id = current_user.id
		if @recommend.save
	       redirect_back(fallback_location: root_path)
    	else
	       render :index
    	end
	end

	def dastroy
		
	end

	private
	def recommend_params
		params.require(:recommend).permit(:artistname, :song, :url, :explanation)
	end
end
