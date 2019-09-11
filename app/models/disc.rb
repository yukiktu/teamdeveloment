class Disc < ApplicationRecord
	belongs_to :item
	has_many :songs
	belongs_to :artist
	belongs_to :genre
	accepts_nested_attributes_for :songs
end
