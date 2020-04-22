class RemoveFavoriteIdToEvents < ActiveRecord::Migration[5.2]
  def change
  	remove_column :events, :favorite_id, :integer
  end
end
