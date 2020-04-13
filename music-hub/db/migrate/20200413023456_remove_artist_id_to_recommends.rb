class RemoveArtistIdToRecommends < ActiveRecord::Migration[5.2]
  def change
  	remove_column :recommends, :artist_id, :integer
  end
end
