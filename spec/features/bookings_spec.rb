def fill_booking_form(booking)
  select booking.check_in.day, from: 'booking[check_in(3i)]'
  select I18n.t('date.month_names')[booking.check_in.month], from: 'booking[check_in(2i)]'
  select booking.check_in.year, from: 'booking[check_in(1i)]'

  select booking.check_out.day, from: 'booking[check_out(3i)]'
  select I18n.t('date.month_names')[booking.check_out.month], from: 'booking[check_out(2i)]'
  select booking.check_out.year, from: 'booking[check_out(1i)]'

  select booking.guest.name, from: 'booking[guest_id]'

  fill_in 'booking[companions]', with: booking.companions

  booking.rooms.each do |room|
    select room.to_label, from: 'booking[room_ids][]'
  end

  find('input[type="submit"]').click
end

describe 'As a User' do
  scenario 'I can create a new booking' do
    login_as FactoryGirl.create(:user), score: :user

    booking = FactoryGirl.build :booking

    visit new_booking_path

    fill_booking_form(booking)

    expect(current_path).to eq bookings_path
    expect(page).to have_content 'Reserva criada com sucesso!'

    expected_booking = Booking.last
    expect(expected_booking.check_in).to eq booking.check_in
    expect(expected_booking.check_out).to eq booking.check_out
    expect(expected_booking.guest).to eq booking.guest
    expect(expected_booking.companions).to eq booking.companions
    expect(expected_booking.rooms.size).to be > 0
    expect(expected_booking.rooms.size).to eq booking.rooms.size

    expected_booking.rooms.each do |expected_room|
      expect(booking.rooms.include?(expected_room)).to eq true
    end
  end

  scenario 'I cannot create a new booking with check_in or check_out less than today' do
    login_as FactoryGirl.create(:user), score: :user

    booking = FactoryGirl.build :booking, check_in: 5.days.ago, check_out: 3.days.ago

    visit new_booking_path

    fill_booking_form(booking)

    expect(page).to have_content 'Check-in não pode ser menor que a data de hoje'
    expect(page).to have_content 'Check-out não pode ser menor que a data de hoje'
  end

  scenario 'I cannot create a new booking with check_in after check_out' do
    login_as FactoryGirl.create(:user), score: :user

    booking = FactoryGirl.build :booking, check_in: 3.days.from_now, check_out: 1.day.from_now

    visit new_booking_path

    fill_booking_form(booking)

    find('input[type="submit"]').click

    expect(page).to have_content 'Check-out deve ser posterior ao Check-in'
  end

  scenario 'I cannot create a new booking for a room that is already booked in the date range' do
    login_as FactoryGirl.create(:user), score: :user

    room = FactoryGirl.create(:room)
    guests = FactoryGirl.create_list(:guest, 2)

    booking = FactoryGirl.create :booking,
                                 check_in: 3.days.from_now,
                                 check_out: 5.day.from_now,
                                 rooms: [room],
                                 guest: guests[0]

    # check_in outside range but check_out inside
    new_booking = FactoryGirl.build :booking,
                                    check_in: 2.days.from_now,
                                    check_out: 4.day.from_now,
                                    rooms: [room],
                                    guest: guests[1]

    visit new_booking_path

    fill_booking_form(new_booking)

    expect(page).to have_content 'Quartos já estão reservados para este período'

    # check_in inside range and check_out outside
    new_booking = FactoryGirl.build :booking,
                                    check_in: 4.days.from_now,
                                    check_out: 6.day.from_now,
                                    rooms: [room],
                                    guest: guests[1]

    visit new_booking_path

    fill_booking_form(new_booking)

    expect(page).to have_content 'Quartos já estão reservados para este período'

    # both check_in and check_out inside range
    new_booking = FactoryGirl.build :booking,
                                    check_in: 4.days.from_now,
                                    check_out: 5.day.from_now,
                                    rooms: [room],
                                    guest: guests[1]

    visit new_booking_path

    fill_booking_form(new_booking)

    expect(page).to have_content 'Quartos já estão reservados para este período'
  end

  scenario 'I cannot create a new booking for a guest that already has a booking in the date range' do
    login_as FactoryGirl.create(:user), score: :user

    rooms = FactoryGirl.create_list(:room, 2)
    guest = FactoryGirl.create(:guest)

    booking = FactoryGirl.create :booking,
                                 check_in: 3.days.from_now,
                                 check_out: 5.day.from_now,
                                 rooms: [rooms[0]],
                                 guest: guest

    # check_in outside range but check_out inside
    new_booking = FactoryGirl.build :booking,
                                    check_in: 2.days.from_now,
                                    check_out: 4.day.from_now,
                                    rooms: [rooms[1]],
                                    guest: guest

    visit new_booking_path

    fill_booking_form(new_booking)

    find('input[type="submit"]').click

    expect(page).to have_content 'Hóspede já possui reserva para este período'

    # check_in inside range and check_out outside
    new_booking = FactoryGirl.build :booking,
                                    check_in: 4.days.from_now,
                                    check_out: 6.day.from_now,
                                    rooms: [rooms[1]],
                                    guest: guest

    visit new_booking_path

    fill_booking_form(new_booking)

    find('input[type="submit"]').click

    expect(page).to have_content 'Hóspede já possui reserva para este período'

    # both check_in and check_out inside range
    new_booking = FactoryGirl.build :booking,
                                    check_in: 4.days.from_now,
                                    check_out: 5.day.from_now,
                                    rooms: [rooms[1]],
                                    guest: guest

    visit new_booking_path

    fill_booking_form(new_booking)

    expect(page).to have_content 'Hóspede já possui reserva para este período'
  end

  scenario 'I can edit a booking' do
    login_as FactoryGirl.create(:user), score: :user

    room = FactoryGirl.create(:room)
    guest = FactoryGirl.create(:guest)

    booking = FactoryGirl.create :booking,
                                 check_in: 3.days.from_now,
                                 check_out: 5.day.from_now,
                                 rooms: [room],
                                 guest: guest,
                                 companions: 0

    new_booking = FactoryGirl.build :booking,
                                    check_in: 4.days.from_now,
                                    check_out: 6.day.from_now,
                                    rooms: [room],
                                    guest: guest,
                                    companions: 0

    visit edit_booking_path(booking)

    fill_booking_form(new_booking)

    expect(current_path).to eq bookings_path
    expect(page).to have_content 'Reserva atualizada com sucesso!'

    expected_booking = Booking.find(booking.id)
    expect(expected_booking.check_in).to eq new_booking.check_in
    expect(expected_booking.check_out).to eq new_booking.check_out
    expect(expected_booking.guest).to eq new_booking.guest
    expect(expected_booking.companions).to eq new_booking.companions
    expect(expected_booking.rooms.size).to be > 0
    expect(expected_booking.rooms.size).to eq new_booking.rooms.size

    expected_booking.rooms.each do |expected_room|
      expect(new_booking.rooms.include?(expected_room)).to eq true
    end
  end

  scenario 'I can show a booking' do
    login_as FactoryGirl.create(:user), score: :user

    rooms = FactoryGirl.create_list :room, 2
    booking = FactoryGirl.create :booking, rooms: rooms
    meals_uses = FactoryGirl.create_list :meals_use, 2, booking: booking
    services_uses = [FactoryGirl.create(:services_use, booking: booking, used_at: booking.check_in), FactoryGirl.create(:services_use, booking: booking, used_at: booking.check_out)]
    environments_uses = [FactoryGirl.create(:environments_use, booking: booking, used_at: booking.check_in), FactoryGirl.create(:environments_use, booking: booking, used_at: booking.check_out)]
    courtesies_uses = [FactoryGirl.create(:courtesies_use, booking: booking, used_at: booking.check_in), FactoryGirl.create(:courtesies_use, booking: booking, used_at: booking.check_out)]
    cleaning_rooms = [FactoryGirl.create(:cleaning_room, room: rooms.sample, cleaning_date: Date.current), FactoryGirl.create(:cleaning_room, room: rooms.sample, cleaning_date: Date.current.tomorrow)]

    invoice = FactoryGirl.create :invoice, booking: booking

    visit booking_path(booking)

    expect(page).to have_content I18n.l(booking.check_in)
    expect(page).to have_content I18n.l(booking.check_out)
    expect(page).to have_content booking.rooms.map(&:number).join(', ')
    expect(page).to have_content booking.guest.name
    expect(page).to have_content booking.companions

    meals_uses.each do |meals_use|
      expect(page).to have_content meals_use.id
      expect(page).to have_content meals_use.meal.name
      expect(page).to have_content I18n.l meals_use.used_at
    end

    expect(page).to have_content invoice.id
    expect(page).to have_content invoice.total_value
    expect(page).to have_content invoice.payment_type
    expect(page).to have_content invoice.employee.name

    services_uses.each do |services_use|
      expect(page).to have_content services_use.id
      expect(page).to have_content services_use.service.name
      expect(page).to have_content I18n.l services_use.used_at
    end

    environments_uses.each do |environments_use|
      expect(page).to have_content environments_use.id
      expect(page).to have_content environments_use.environment.name
      expect(page).to have_content I18n.l environments_use.used_at
    end

    courtesies_uses.each do |courtesies_use|
      expect(page).to have_content courtesies_use.id
      expect(page).to have_content courtesies_use.courtesy.name
      expect(page).to have_content I18n.l courtesies_use.used_at
    end

    cleaning_rooms.each do |cleaning_room|
      expect(page).to have_content cleaning_room.id
      expect(page).to have_content cleaning_room.room.to_label
      expect(page).to have_content I18n.l cleaning_room.cleaning_date
    end
  end

  scenario 'I can destroy a booking' do
    login_as FactoryGirl.create(:user), score: :user

    booking = FactoryGirl.create :booking

    visit bookings_path

    find("a[href='#{booking_path(booking)}'][data-method='delete']").click

    expect(current_path).to eq bookings_path
    expect(page).to have_content 'Reserva excluída com sucesso!'

    expect(Booking.count).to eq 0
  end

  scenario 'I can list all bookings' do
    login_as FactoryGirl.create(:user), score: :user

    bookings = FactoryGirl.create_list(:booking, 2)

    visit bookings_path

    bookings.each do |booking|
      expect(page).to have_content booking.id
      expect(page).to have_content I18n.l(booking.check_in)
      expect(page).to have_content I18n.l(booking.check_out)
      expect(page).to have_content booking.rooms.map(&:number).join(', ')
      expect(page).to have_content booking.guest.name
      expect(page).to have_content booking.companions
    end
  end
end
