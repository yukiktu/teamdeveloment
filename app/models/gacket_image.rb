class GacketImage < ApplicationRecord


	belongs_to :item
	attachment :image
end
