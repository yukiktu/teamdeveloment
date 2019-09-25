class TaxRate < ApplicationRecord
	validates :tax_rate, {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/}
end
