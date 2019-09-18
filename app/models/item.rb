class Item < ApplicationRecord
	def self.search(search)
      if search
        Item.where(['content LIKE ?', "%#{item_name}%"])
      else
        Item.all
      end
    end

    has_many :gacket_images
    accepts_attachments_for :gacket_images, attachment: :image
    belongs_to :label
    belongs_to :genre
    belongs_to :artist
    has_many :discs
    accepts_nested_attributes_for :discs
    has_many :arrivals
    #has_many :songs
    #accepts_nested_attributes_for :songs
end
