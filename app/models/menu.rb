class Menu < ApplicationRecord
  belongs_to :user

  has_many :menu_dishes, dependent: :destroy
  has_many :dishes,     through: :menu_dishes
end
