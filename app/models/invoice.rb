class Invoice < ApplicationRecord
  belongs_to :booking
  belongs_to :employee

  validates :total_value, presence: true
  validates :payment_type, presence: true
  validates :employee, presence: true
  validates :booking, presence: true, uniqueness: true
end
