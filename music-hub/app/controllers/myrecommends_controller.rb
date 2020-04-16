class MyrecommendsController < ApplicationController
	before_action :set_recommend

  def create
    @myrecommend = Myrecommend.create(user_id: current_user.id, recommend_id: @recommend.id, artist_id: @artist.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @myrecommend = Myrecommend.find_by(user_id: current_user.id, recommend_id: @recommend.id, artist_id: @artist.id)
    @myrecommend.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_recommend
    @artist = Artist.find(params[:artist_id])
    @recommend = Recommend.find(params[:recommend_id])
  end
end
