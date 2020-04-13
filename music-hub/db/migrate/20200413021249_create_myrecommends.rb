class CreateMyrecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :myrecommends do |t|
      t.integer :user_id
      t.integer :recommend_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
