class ServicesUse < ApplicationRecord
  belongs_to :booking
  belongs_to :service

  validates :booking, presence: true
  validates :service, presence: true
  validates :used_at, presence: true
  validates :booking, uniqueness: { scope: [:service, :used_at] }

  validate :service_must_belongs_to_any_room_of_booking
  validate :used_at_must_be_between_check_in_and_check_out_of_booking

  private

  def used_at_must_be_between_check_in_and_check_out_of_booking
    errors.add(:used_at, 'deve estar entre o check-in e check-out da Reserva') if used_at.present? && booking.present? && !used_at.between?(booking.check_in, booking.check_out)
  end

  def service_must_belongs_to_any_room_of_booking
    errors.add(:service, 'deve estar associado a algum dos quartos da Reserva') if service.present? && booking.present? && !booking.rooms.map(&:services).flatten.include?(service)
  end
end
