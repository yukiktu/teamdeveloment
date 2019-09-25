class DeliveryAdress < ApplicationRecord
	belongs_to :end_user

	validates :addresses, length: { maximum: 75 }
	# validates :postal_code, presence: true
	validates :address, length: { maximum: 75 }
	# validates :phone_number, presence: true
end
