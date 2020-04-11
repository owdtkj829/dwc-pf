class FavoritesController < ApplicationController
	before_action :set_artist

  def create
    @favorite = Favorite.create(user_id: current_user.id, artist_id: @artist.id, name: @artist.name)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, artist_id: @artist.id,name: @artist.name)
    @favorite.destroy
  end

  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
