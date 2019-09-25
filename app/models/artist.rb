class Artist < ApplicationRecord

	has_many :items
	validates :artist_name, length: { maximum: 26 }
end
