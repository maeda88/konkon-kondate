class Dish < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :dish, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
