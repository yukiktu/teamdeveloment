class ShippingFee < ApplicationRecord
	validates :shipping_fee, {with: /\A[0-9]+\z/}
end
