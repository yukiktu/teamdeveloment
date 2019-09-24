class ShippingFee < ApplicationRecord
	validates :shipping_fee, presence: true
end
