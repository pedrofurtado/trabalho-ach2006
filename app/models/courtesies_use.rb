class CourtesiesUse < ApplicationRecord
  belongs_to :booking
  belongs_to :courtesy

  validates :booking, presence: true
  validates :courtesy, presence: true
  validates :used_at, presence: true
  validates :booking, uniqueness: { scope: [:courtesy, :used_at] }

  validate :used_at_must_be_between_check_in_and_check_out_of_booking
  validate :courtesy_must_belongs_to_any_service_of_booking

  private

  def used_at_must_be_between_check_in_and_check_out_of_booking
    errors.add(:used_at, 'deve estar entre o check-in e check-out da Reserva') if used_at.present? && booking.present? && !used_at.between?(booking.check_in, booking.check_out)
  end

  def courtesy_must_belongs_to_any_service_of_booking
    errors.add(:courtesy, 'deve estar associado a algum dos serviços da Reserva') if courtesy.present? && booking.present? && !(courtesy.services.any? { |service| booking.rooms.map(&:services).flatten.include?(service) })
  end
end
