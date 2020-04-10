class AddUserIdToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :user_id, :integer
  end
end
