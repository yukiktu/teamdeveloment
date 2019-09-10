class Item < ApplicationRecord
	def self.search(search)
      if search
        Item.where(['content LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end

    belongs_to :label
    hasmany :discs
    accepts_nested_attributes_for :discs
end
