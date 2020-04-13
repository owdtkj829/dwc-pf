class AddArtistIdToRecommends < ActiveRecord::Migration[5.2]
  def change
    add_column :recommends, :artist_id, :integer
  end
end
