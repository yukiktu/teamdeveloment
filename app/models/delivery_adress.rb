class DeliveryAdress < ApplicationRecord
	belongs_to :end_user

	validates :addresses, presence: true
	validates :postal_code, presence: true
	validates :address, presence: true
	validates :phone_number, presence: true
end
