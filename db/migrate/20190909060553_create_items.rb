class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :label_id
      t.string :item_name
      t.decimal :list_price
      t.decimal :cost_price
      t.string :sales_status
      t.date :release_date

      t.timestamps
    end
  end
end
