class Disc < ApplicationRecord
	belong_to :item
	belong_to :genre
	has_many :songs
end
