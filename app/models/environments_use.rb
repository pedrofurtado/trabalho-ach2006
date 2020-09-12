class EnvironmentsUse < ApplicationRecord
  belongs_to :booking
  belongs_to :environment

  validates :booking, presence: true
  validates :environment, presence: true
  validates :used_at, presence: true
  validates :booking, uniqueness: { scope: [:environment, :used_at] }

  validate :used_at_must_be_between_check_in_and_check_out_of_booking

  private

  def used_at_must_be_between_check_in_and_check_out_of_booking
    errors.add(:used_at, 'deve estar entre o check-in e check-out da Reserva') if used_at.present? && booking.present? && !used_at.between?(booking.check_in, booking.check_out)
  end
end
