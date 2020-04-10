class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :artist_id
      t.text :venue
      t.datetime :start
      t.datetime :finish
      t.text :url
      t.text :memo
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
