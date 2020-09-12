class CleaningEnvironment < ApplicationRecord
  belongs_to :environment

  validates :environment, presence: true
  validates :cleaning_date, presence: true
  validates :cleaning_date, uniqueness: { scope: :environment }
end
