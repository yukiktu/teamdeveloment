class Arrival < ApplicationRecord
	belongs_to :item

	# validates :arrival_count, presence: true
	# validates :arrival_expected_date, presence: true
	# validates :purchase_order_date, presence: true
end
