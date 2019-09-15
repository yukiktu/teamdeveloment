class AddDefaultToOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:orders, :delivery_status, 0)
  end
end
