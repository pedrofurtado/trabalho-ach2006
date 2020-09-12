describe 'As a User' do
  scenario 'I can create a new room' do
    login_as FactoryGirl.create(:user), score: :user

    room = FactoryGirl.build :room, services: FactoryGirl.create_list(:service,2)

    visit new_room_path

    fill_in 'room[number]', with: room.number
    fill_in 'room[guest_limit]', with: room.guest_limit

    room.services.each do |service|
      select service.name, from: 'room[service_ids][]'
    end

    find('input[type="submit"]').click

    expect(current_path).to eq rooms_path
    expect(page).to have_content 'Quarto criado com sucesso!'

    expected_room = Room.last
    expect(expected_room.number).to eq room.number
    expect(expected_room.guest_limit).to eq room.guest_limit
    expect(expected_room.services.size).to be > 0
    expect(expected_room.services.size).to eq room.services.size

    expected_room.services.each do |expected_service|
      expect(room.services.include?(expected_service)).to eq true
    end
  end

  scenario 'I cannot create a room with a duplicated number' do
    login_as FactoryGirl.create(:user), score: :user

    room = FactoryGirl.create(:room, number: 22)

    visit new_room_path

    fill_in 'room[number]', with: room.number
    fill_in 'room[guest_limit]', with: room.guest_limit
    find('input[type="submit"]').click

    expect(page).to have_content 'Número já está em uso'
  end

  scenario 'I can edit a room' do
    login_as FactoryGirl.create(:user), scope: :user

    room = FactoryGirl.create :room
    new_room = FactoryGirl.build :room, services: room.services

    visit edit_room_path(room)

    fill_in 'room[number]', with: new_room.number
    fill_in 'room[guest_limit]', with: new_room.guest_limit

    new_room.services.each do |service|
      select service.name, from: 'room[service_ids][]'
    end

    find('input[type=submit]').click

    expect(current_path).to eq rooms_path
    expect(page).to have_content 'Quarto atualizado com sucesso!'

    expected_room = Room.find(room.id)
    expect(expected_room.number).to eq new_room.number
    expect(expected_room.guest_limit).to eq new_room.guest_limit
    expect(expected_room.services.size).to be > 0
    expect(expected_room.services.size).to eq new_room.services.size

    expected_room.services.each do |expected_service|
      expect(new_room.services.include?(expected_service)).to eq true
    end

  end

  scenario 'I can show a room' do
    login_as FactoryGirl.create(:user), scope: :user

    room = FactoryGirl.create :room, services: FactoryGirl.create_list(:service, 2)

    today = Time.now

    current_booking = FactoryGirl.create :booking, check_in: today,
                                                   check_out: today + 1.day,
                                                   rooms: [room]

    visit room_path(room)

    expect(page).to have_content room.number
    expect(page).to have_content room.guest_limit

    room.services.each do |service|
      expect(page).to have_content service.name
    end

    room.cleaning_rooms.each do |cleaning_room|
      expect(page).to have_content cleaning_room.id
      expect(page).to have_content I18n.l(cleaning_room.cleaning_date)
    end

    expect(page).to have_content current_booking.id
    expect(page).to have_content I18n.l current_booking.check_in
    expect(page).to have_content I18n.l current_booking.check_out
    expect(page).to have_content current_booking.rooms.map(&:number).join(', ')
    expect(page).to have_content current_booking.guest.name
    expect(page).to have_content current_booking.companions
  end

  scenario 'I can destroy a room' do
    login_as FactoryGirl.create(:user), scope: :user

    room = FactoryGirl.create :room, services: FactoryGirl.create_list(:service, 2)

    visit rooms_path

    find("a[href='#{room_path(room)}'][data-method='delete']").click

    expect(current_path).to eq rooms_path
    expect(page).to have_content 'Quarto excluído com sucesso!'

    expect(Room.count).to eq 0
    expect(room.services.reload.count).to eq 0
  end

  scenario 'I can list all rooms' do
    login_as FactoryGirl.create(:user), scope: :user

    rooms = FactoryGirl.create_list :room, 2

    visit rooms_path

    rooms.each do |room|
      expect(page).to have_content room.id
      expect(page).to have_content room.number
      expect(page).to have_content room.guest_limit
    end
  end
end
