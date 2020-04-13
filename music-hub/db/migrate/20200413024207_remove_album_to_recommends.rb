class RemoveAlbumToRecommends < ActiveRecord::Migration[5.2]
  def change
  	remove_column :recommends, :album, :text
  end
end
