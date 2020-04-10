class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :image_id
      t.text :explanation
      t.datetime :created_day
      t.datetime :updated_day
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
