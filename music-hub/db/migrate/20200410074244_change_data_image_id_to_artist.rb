class ChangeDataImageIdToArtist < ActiveRecord::Migration[5.2]
  def change
  	change_column :artists, :image_id, :string
  end
end
