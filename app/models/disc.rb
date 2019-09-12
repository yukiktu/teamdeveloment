class Disc < ApplicationRecord
	belongs_to :item
	has_many :songs
	belongs_to :artist
	belongs_to :genre
end
