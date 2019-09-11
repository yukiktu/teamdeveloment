class AddNullToOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :orders, :end_user_id, false
  	change_column_null :orders, :addressee, false
  	change_column_null :orders, :postal_code, false
  	change_column_null :orders, :address, false
  	change_column_null :orders, :created_at, false
  	change_column_null :orders, :payment_methods, false
  	change_column_null :orders, :subtotal, false
  	change_column_null :orders, :shipping_fee, false
  	change_column_null :orders, :grand_total, false
  end
end
