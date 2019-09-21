class Item < ApplicationRecord
    has_many :gacket_images
    accepts_attachments_for :gacket_images, attachment: :image
    belongs_to :label
    belongs_to :genre
    belongs_to :artist
    has_many :discs
    accepts_nested_attributes_for :discs
    has_many :arrivals

    def self.search_method(search)
      if search
        Item.where(['item_name LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end
end
