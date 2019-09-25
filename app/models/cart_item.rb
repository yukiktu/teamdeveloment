class CartItem < ApplicationRecord
	belongs_to :end_user
	# validates :item_count, presence: true
end
