class CartItemsController < ApplicationController
before_action :authenticate_end_user!

	def index
		@cart_items = CartItem.where(end_user_id: current_end_user)
		#@gacket_images = Gacket_image.where(item_id: @cart_items.item_id)
	end

	def create
		cart_item = CartItem.find_by(params[:id])
		if cart_item.blank?
			cart_item = CartItem.new(cart_item_params)
			cart_item.item_count = 1
		else
			cart_item.item_count +=1
		end
		cart_item.save
		#binding.pry
		redirect_to cart_items_path
	end

	def update
		@cart_item.update
	end

	def destroy
		@cart_item.delete
	end

	private

		def cart_item_params
			params.require(:cart_items).permit(:end_user_id, :item_count, :item_id)
		end
end