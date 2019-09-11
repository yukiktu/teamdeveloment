class Item < ApplicationRecord
	def self.search(search)
      if search
        Item.where(['content LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end

   has_many :gacket_images
   accepts_nested_attributes_for :gacket_images
    belongs_to :label
    has_many :discs
    accepts_nested_attributes_for :discs
    has_many :songs
    accepts_nested_attributes_for :songs
end
