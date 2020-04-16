class AddArtistIdToMyrecommends < ActiveRecord::Migration[5.2]
  def change
    add_column :myrecommends, :artist_id, :integer
  end
end
