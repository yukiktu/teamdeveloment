class AddIndexToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_index :orders, :end_user_id
  	add_index :orders, :addressee
  	add_index :orders, :address
  	add_index :orders, :phone_number
  end
end
