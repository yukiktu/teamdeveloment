class Order < ApplicationRecord
	#enum deryvery_status: {undelivered: 0, delivered: 1}
	belongs_to :end_user
	has_many :order_items

	validates :addressee, presence: true
	validates :postal_code, presence: true
	validates :address, presence: true
	validates :phone_number, presence: true
	validates :payment_methods, acceptance: true
end
