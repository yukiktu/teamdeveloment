class Item < ApplicationRecord
	belongs_to :artist
	has_many :gacket_images
	has_many :discs
	has_many :arrivals

	accepts_attachments_for :gacket_images, attachment: :image
end
