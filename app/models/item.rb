class Item < ApplicationRecord
	def self.search(search)
      if search
        Item.where(['content LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end

    has_many :gacket_images
    accepts_attachments_for :gacket_images, attachment: :image
    belongs_to :label
    has_many :discs
    has_many :songs
end
