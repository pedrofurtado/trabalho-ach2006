class Service < ApplicationRecord
  has_and_belongs_to_many :courtesies
  has_and_belongs_to_many :rooms
  has_many :services_uses, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
end
