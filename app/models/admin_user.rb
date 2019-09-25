class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def self.search_method(search)
      if search
        Item.where(['item_name LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end
end
