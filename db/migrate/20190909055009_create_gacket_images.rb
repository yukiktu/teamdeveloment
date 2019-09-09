class CreateGacketImages < ActiveRecord::Migration[5.2]
  def change
    create_table :gacket_images do |t|
      t.integer :item_id
      t.integer :jacket_number
      t.string :image_id

      t.timestamps
    end
  end
end
