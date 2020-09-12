module BookingWorld
  def initialize_booking_world
    @guests = FactoryGirl.create_list(:guest, 3)
  end
end

World(BookingWorld)

Before('@create_booking_guest_limit_exceded') do
  initialize_booking_world
end

When('I go to the new booking page') do
  visit new_booking_path
end

Given('Exists a room with 5 guest limit') do
  @room = FactoryGirl.create :room, guest_limit: 5
end

When('I fill the booking form with 5 companions and submit') do
  @booking = FactoryGirl.build :booking, companions: 5, guest: @guests.first, rooms: [@room]
  select @booking.check_in.day, from: 'booking[check_in(3i)]'
  select I18n.t('date.month_names')[@booking.check_in.month], from: 'booking[check_in(2i)]'
  select @booking.check_in.year, from: 'booking[check_in(1i)]'
  select @booking.check_out.day, from: 'booking[check_out(3i)]'
  select I18n.t('date.month_names')[@booking.check_out.month], from: 'booking[check_out(2i)]'
  select @booking.check_out.year, from: 'booking[check_out(1i)]'
  select @booking.guest.name, from: 'booking[guest_id]'
  fill_in 'booking[companions]', with: @booking.companions
  @booking.rooms.each do |room|
    select room.to_label, from: 'booking[room_ids][]'
  end
  find('input[type="submit"]').click
end

Then('I will see a guest limit exceded error') do
  expect(page).to have_content 'Acompanhantes : Limite total de 5 hóspedes excedido'
end
