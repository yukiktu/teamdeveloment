class CartItemsController < ApplicationController


	def edit
		@cart_item = Cart_item.where(end_user_id: currentuser)
		@item = Item.find_by(id: @cart_item.item_id)
	end

	def create
		item = Item.find(params[:id])
		if @cart_item.item_id == item.id
			@cart_items.item_count +=1
		else
			@cart_items = Cart_item.New{cart_item_params}
			@cart_item.end_user_id = currentuser
			@cart_items.item_id = item.id
			@cart_item.item_count = 1

		end
		redirect_to edit_cart_item_path(currentuser)
	end

	def update
		@cart_item.update
	end

	def destroy
		@cart_item.delete
	end

	private
		def cart_item_params
			params.require(:cart_item).require(:id, :end_user_id, :item_count, :item_id)
		end




end
