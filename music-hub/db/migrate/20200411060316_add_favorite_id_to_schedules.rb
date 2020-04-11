class AddFavoriteIdToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :favorite_id, :integer
  end
end
