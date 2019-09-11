class Disc < ApplicationRecord
	belongs_to :item
	belongs_to :genre
	has_many :songs
end
