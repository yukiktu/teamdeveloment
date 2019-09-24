class Label < ApplicationRecord
	has_many :items

	validates :label_name, presence: true,
	           length: { minimum: 1}

end
