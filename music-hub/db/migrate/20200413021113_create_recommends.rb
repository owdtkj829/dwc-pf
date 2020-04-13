class CreateRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :recommends do |t|
      t.integer :user_id
      t.integer :artist_id
      t.string :artistname
      t.text :song
      t.text :album
      t.text :url
      t.text :explanation
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
