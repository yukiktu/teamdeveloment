class Arrival < ApplicationRecord
	belongs_to :item
	enum l_status_id: [['---',""], ['✅']]
end
