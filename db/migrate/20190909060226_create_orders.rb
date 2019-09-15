class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :addressee
      t.string :postal_code
      t.text :address
      t.string :phone_number
      t.string :payment_methods
      t.decimal :subtotal
      t.decimal :shipping_fee
      t.decimal :grand_total
      t.integer :delivery_status
      t.string :artist_name
      t.timestamps
    end
  end
end
