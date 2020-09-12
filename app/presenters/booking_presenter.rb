class BookingPresenter
  def initialize(bookings)
    @bookings = bookings
  end

  def to_fullcalendar
    bookings.present? ? bookings.map { |booking| build_fullcalendar_event_for(booking) }.to_json.html_safe : [].to_json.html_safe
  end

  private

  include Rails.application.routes.url_helpers

  attr_reader :bookings

  def build_fullcalendar_event_for(booking)
    {
      id: "booking_#{booking.id}",
      title: booking.guest.name,
      start: booking.check_in.beginning_of_day.rfc3339,
      end: booking.check_out.end_of_day.rfc3339,
      url: booking_path(booking)
    }
  end
end
