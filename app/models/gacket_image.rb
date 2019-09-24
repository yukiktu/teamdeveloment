class GacketImage < ApplicationRecord
	belongs_to :item
	attachment :image

	validates :jacket_number, presence: true
end
