class Employee < ApplicationRecord
  has_many :invoices, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true
  validates :office, presence: true
end
