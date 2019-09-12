class AddDefaultToCartItems < ActiveRecord::Migration[5.2]
	def change
    	change_column_null :cart_items, :end_user_id, false
		change_column_null :cart_items, :item_count, 1, false
    	change_column_null :cart_items, :item_id, false
  	end
end
