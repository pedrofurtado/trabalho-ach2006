class Room < ApplicationRecord
  has_and_belongs_to_many :services
  has_and_belongs_to_many :bookings
  has_many :cleaning_rooms, dependent: :destroy

  validates :number, presence: true, uniqueness: true
  validates :guest_limit, presence: true

  def to_label
    "Quarto: #{number} | #{guest_limit} hóspedes"
  end

  def current_booking
    bookings.select { |booking| Time.now.between?(booking.check_in, booking.check_out) }.first
  end
end
