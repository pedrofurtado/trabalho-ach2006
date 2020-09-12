describe BookingPresenter do
  describe '#to_fullcalendar' do
    it 'Returns the JSON data with event options for FullCalendar jQuery Plugin' do
      bookings = FactoryGirl.create_list :booking, 2
      fullcalendar_events = JSON.parse(BookingPresenter.new(bookings).to_fullcalendar).sort_by { |fullcalendar_event| fullcalendar_event['id'] }

      expect(fullcalendar_events.size).to eq 2

      bookings.sort_by(&:id).each_with_index do |booking, i|
        expect(fullcalendar_events[i]['id']).to eq "booking_#{booking.id}"
        expect(fullcalendar_events[i]['title']).to eq booking.guest.name
        expect(fullcalendar_events[i]['start']).to eq booking.check_in.beginning_of_day.rfc3339
        expect(fullcalendar_events[i]['end']).to eq booking.check_out.end_of_day.rfc3339
        expect(fullcalendar_events[i]['url']).to eq booking_path(booking)
      end
    end

    it 'Returns an empty JSON' do
      expect(JSON.parse(BookingPresenter.new([]).to_fullcalendar)).to eq []
      expect(JSON.parse(BookingPresenter.new(nil).to_fullcalendar)).to eq []
    end
  end
end
