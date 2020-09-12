class Meal < ApplicationRecord
  has_many :meals_uses, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
end
