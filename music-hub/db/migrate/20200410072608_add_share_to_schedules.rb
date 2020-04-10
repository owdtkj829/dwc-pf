class AddShareToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :share, :integer
  end
end
