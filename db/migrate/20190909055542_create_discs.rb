class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :artist_id
      t.integer :genre_id
      t.integer :item_id
      t.string :disc_name
      t.integer :disc_number

      t.timestamps
    end
  end
end
