class Booking < ApplicationRecord
  has_and_belongs_to_many :rooms
  belongs_to :guest
  has_one :invoice, dependent: :destroy
  has_many :services_uses, dependent: :destroy
  has_many :courtesies_uses, dependent: :destroy
  has_many :environments_uses, dependent: :destroy
  has_many :meals_uses, dependent: :destroy

  validates :rooms, presence: true
  validates :guest, presence: true
  validates :companions, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
  validate :check_out_must_be_after_check_in,
           :room_must_not_have_booking_between_check_in_and_check_out,
           :guest_must_not_have_booking_between_check_in_and_check_out,
           :companions_must_not_exceed_rooms_guest_limit

  validate :check_in_and_check_out_must_not_be_in_the_past, on: :create

  def check_in_and_check_out_must_not_be_in_the_past
    errors.add(:check_in, 'não pode ser menor que a data de hoje') if check_in < Date.today
    errors.add(:check_out, 'não pode ser menor que a data de hoje') if check_out < Date.today
  end

  def check_out_must_be_after_check_in
    errors.add(:check_out, 'deve ser posterior ao Check-in') if check_out <= check_in
  end

  def room_must_not_have_booking_between_check_in_and_check_out
    errors.add(:rooms, 'já estão reservados para este período') if rooms.any? { |room| has_booking_between?(room&.bookings) }
  end

  def guest_must_not_have_booking_between_check_in_and_check_out
    errors.add(:guest, 'já possui reserva para este período') if has_booking_between?(guest&.bookings)
  end

  def has_booking_between?(bookings)
    bookings&.any? { |booking|
      booking.id != id &&
      (booking.check_in.between?(check_in, check_out) ||
       booking.check_out.between?(check_in, check_out))
    }
  end

  def companions_must_not_exceed_rooms_guest_limit
    total_limit = rooms.inject(0){ |sum, e| sum + e.guest_limit }
    errors.add(:companions, ': Limite total de %s hóspedes excedido' % [total_limit]) if companions + 1 > total_limit
  end

  def to_label
    "Reserva de #{check_in} até #{check_out}"
  end
end
