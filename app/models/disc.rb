class Disc < ApplicationRecord
	belongs_to :item
	has_many :songs
	has_many :artists
	has_many :genres
	accepts_nested_attributes_for :songs, :artists, :genres
end
