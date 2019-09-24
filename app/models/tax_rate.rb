class TaxRate < ApplicationRecord
	validates :tax_rate, presence: true
end
