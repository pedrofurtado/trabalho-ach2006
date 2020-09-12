class Environment < ApplicationRecord
  has_many :cleaning_environments, dependent: :destroy
  has_many :environments_uses, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
end
