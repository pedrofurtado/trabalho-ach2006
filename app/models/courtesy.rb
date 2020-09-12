class Courtesy < ApplicationRecord
  has_and_belongs_to_many :services
  has_many :courtesies_uses, dependent: :destroy
  
  validates :name, presence: true
  validates :price, presence: true
end
