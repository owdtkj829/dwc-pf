class RemoveUseriddToUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :userid, :string
  end
end
