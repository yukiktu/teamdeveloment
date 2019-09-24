class Disc < ApplicationRecord
	belongs_to :item
	has_many :songs
	accepts_nested_attributes_for :songs
	# belongs_to :artist
	# belongs_to :genre

	validates :disc_name, presence: true
	validates :disc_number, presence: true
end


