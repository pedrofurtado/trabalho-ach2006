class CleaningRoom < ApplicationRecord
  belongs_to :room

  validates :room, presence: true
  validates :cleaning_date, presence: true
  validates :cleaning_date, uniqueness: { scope: :room }
end
