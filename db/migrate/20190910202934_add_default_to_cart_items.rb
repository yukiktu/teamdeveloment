class AddDefaultToCartItems < ActiveRecord::Migration[5.2]
	def change
<<<<<<< HEAD
=======
		
>>>>>>> 8749b72ecf2947188dfd4e8d997c695fff3ac350
    	change_column_null :cart_items, :end_user_id, false
		change_column_null :cart_items, :item_count, 1, false
    	change_column_null :cart_items, :item_id, false
  	end
end
