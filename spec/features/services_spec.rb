describe 'As a User' do
  scenario 'I can create a new service' do
    login_as FactoryGirl.create(:user), scope: :user

    service = FactoryGirl.build :service, courtesies: FactoryGirl.create_list(:courtesy, 2), rooms: FactoryGirl.create_list(:room, 2)

    visit new_service_path

    fill_in 'service[name]', with: service.name
    fill_in 'service[description]', with: service.description
    fill_in 'service[price]', with: service.price

    service.courtesies.each do |courtesy|
      select courtesy.name, from: 'service[courtesy_ids][]'
    end

    service.rooms.each do |room|
      select room.number, from: 'service[room_ids][]'
    end

    find('input[type="submit"]').click

    expect(current_path).to eq services_path
    expect(page).to have_content 'Serviço criado com sucesso!'

    expected_service = Service.last
    expect(expected_service.name).to eq service.name
    expect(expected_service.description).to eq service.description
    expect(expected_service.price).to eq service.price
    expect(expected_service.courtesies.size).to be > 0
    expect(expected_service.courtesies.size).to eq service.courtesies.size

    expected_service.courtesies.each do |expected_courtesy|
      expect(service.courtesies.include?(expected_courtesy)).to eq true
    end

    expected_service.rooms.each do |expected_room|
      expect(service.rooms.include?(expected_room)).to eq true
    end

  end

  scenario 'I can edit a service' do
    login_as FactoryGirl.create(:user), scope: :user

    service = FactoryGirl.create :service
    new_service = FactoryGirl.build :service, courtesies: FactoryGirl.create_list(:courtesy, 2),
    rooms: FactoryGirl.create_list(:room, 2)

    visit edit_service_path(service)

    fill_in 'service[name]', with: new_service.name
    fill_in 'service[description]', with: new_service.description
    fill_in 'service[price]', with: new_service.price

    new_service.courtesies.each do |courtesy|
      select courtesy.name, from: 'service[courtesy_ids][]'
    end

    new_service.rooms.each do |room|
      select room.number, from: 'service[room_ids][]'
    end

    find('input[type="submit"]').click

    expect(current_path).to eq services_path
    expect(page).to have_content 'Serviço atualizado com sucesso!'

    expected_service = Service.find(service.id)
    expect(expected_service.name).to eq new_service.name
    expect(expected_service.description).to eq new_service.description
    expect(expected_service.price).to eq new_service.price
    expect(expected_service.courtesies.size).to be > 0
    expect(expected_service.courtesies.size).to eq new_service.courtesies.size
    expect(expected_service.rooms.size).to be > 0
    expect(expected_service.rooms.size).to eq new_service.rooms.size

    expected_service.courtesies.each do |expected_courtesy|
      expect(new_service.courtesies.include?(expected_courtesy)).to eq true
    end

    expected_service.rooms.each do |expected_room|
      expect(new_service.rooms.include?(expected_room)).to eq true
    end

  end

  scenario 'I can show a service' do
    login_as FactoryGirl.create(:user), scope: :user

    service = FactoryGirl.create :service, courtesies: FactoryGirl.create_list(:courtesy, 2), rooms: FactoryGirl.create_list(:room, 2)
    guest = FactoryGirl.create :guest 
    rooms = FactoryGirl.create_list :room, 2, services: [service]
    booking = FactoryGirl.create :booking, rooms: rooms, guest: guest, check_in: Date.today 
    services_uses = FactoryGirl.create :services_use, service: service, booking: booking, used_at: Date.today 
    
    visit service_path(service)

    expect(page).to have_content service.name
    expect(page).to have_content service.description
    expect(page).to have_content service.price

    service.courtesies.each do |courtesy|
      expect(page).to have_content courtesy.name
    end

    service.rooms.each do |room|
      expect(page).to have_content room.number
    end

    expect(page).to have_content guest.id 
    expect(page).to have_content guest.name 
    expect(page).to have_content guest.phone 
    expect(page).to have_content guest.email 
  end

  scenario 'I can destroy a service' do
    login_as FactoryGirl.create(:user), scope: :user

    service = FactoryGirl.create :service, courtesies: FactoryGirl.create_list(:courtesy, 2), rooms: FactoryGirl.create_list(:room, 2)

    visit services_path

    find("a[href='#{service_path(service)}'][data-method='delete']").click

    expect(current_path).to eq services_path
    expect(page).to have_content 'Serviço excluído com sucesso!'

    expect(Service.find_by(id: service.id)).to be_nil
    expect(service.courtesies.reload.count).to eq 0
    expect(service.rooms.reload.count).to eq 0
  end

  scenario 'I can list all services' do
    login_as FactoryGirl.create(:user), scope: :user

    services = FactoryGirl.create_list :service, 2

    visit services_path

    services.each do |service|
      expect(page).to have_content service.id
      expect(page).to have_content service.name
      expect(page).to have_content service.description
      expect(page).to have_content service.price
    end
  end
end
