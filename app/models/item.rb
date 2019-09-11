class Item < ApplicationRecord
	belong_to :artist
	has_many :gacket_image
	has_many :discs
	has_many :arrivals
end
