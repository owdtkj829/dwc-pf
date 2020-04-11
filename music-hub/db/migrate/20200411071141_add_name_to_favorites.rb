class AddNameToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :name, :string
  end
end
