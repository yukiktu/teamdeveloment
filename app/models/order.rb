class Order < ApplicationRecord
	#enum deryvery_status: {undelivered: 0, delivered: 1}
	belongs_to :end_user
	has_many :order_items

	# validates :addressee, length: { maximum: 75 }
	# validates :postal_code, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/}
	# validates :address, length: { maximum: 75 }
	# VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
	# validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
	# validates :payment_methods, acceptance: true
end
