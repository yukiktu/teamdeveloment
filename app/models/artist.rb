class Artist < ApplicationRecord
	belong_to :label
	has_many :items
end
