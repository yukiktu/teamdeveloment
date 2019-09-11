class Artist < ApplicationRecord
	belongs_to :label
	has_many :items
end
