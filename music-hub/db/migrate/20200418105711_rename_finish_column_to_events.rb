class RenameFinishColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :finish, :end
  end
end
