describe 'As a User' do
  scenario 'I can create a new courtesy' do
    login_as FactoryGirl.create(:user), scope: :user

    courtesy = FactoryGirl.build :courtesy, services: FactoryGirl.create_list(:service, 2)

    visit new_courtesy_path

    fill_in 'courtesy[name]', with: courtesy.name
    fill_in 'courtesy[description]', with: courtesy.description
    fill_in 'courtesy[price]', with: courtesy.price

    courtesy.services.each do |service|
      select service.name, from: 'courtesy[service_ids][]'
    end

    find('input[type="submit"]').click

    expect(current_path).to eq courtesies_path
    expect(page).to have_content 'Produto-cortesia criado com sucesso!'

    expected_courtesy = Courtesy.last
    expect(expected_courtesy.name).to eq courtesy.name
    expect(expected_courtesy.description).to eq courtesy.description
    expect(expected_courtesy.price).to eq courtesy.price
    expect(expected_courtesy.services.size).to be > 0
    expect(expected_courtesy.services.size).to eq courtesy.services.size

    expected_courtesy.services.each do |expected_service|
      expect(courtesy.services.include?(expected_service)).to eq true
    end
  end

  scenario 'I can edit a courtesy' do
    login_as FactoryGirl.create(:user), scope: :user

    courtesy = FactoryGirl.create :courtesy
    new_courtesy = FactoryGirl.build :courtesy, services: FactoryGirl.create_list(:service, 2)

    visit edit_courtesy_path(courtesy)

    fill_in 'courtesy[name]', with: new_courtesy.name
    fill_in 'courtesy[description]', with: new_courtesy.description
    fill_in 'courtesy[price]', with: new_courtesy.price

    new_courtesy.services.each do |service|
      select service.name, from: 'courtesy[service_ids][]'
    end

    find('input[type="submit"]').click

    expect(current_path).to eq courtesies_path
    expect(page).to have_content 'Produto-cortesia atualizado com sucesso!'

    expected_courtesy = Courtesy.find(courtesy.id)
    expect(expected_courtesy.name).to eq new_courtesy.name
    expect(expected_courtesy.description).to eq new_courtesy.description
    expect(expected_courtesy.price).to eq new_courtesy.price
    expect(expected_courtesy.services.size).to be > 0
    expect(expected_courtesy.services.size).to eq new_courtesy.services.size

    expected_courtesy.services.each do |expected_service|
      expect(new_courtesy.services.include?(expected_service)).to eq true
    end
  end

  scenario 'I can show a courtesy' do
    login_as FactoryGirl.create(:user), scope: :user

    courtesy = FactoryGirl.create :courtesy, services: FactoryGirl.create_list(:service, 2)
    guest = FactoryGirl.create :guest
    rooms = FactoryGirl.create_list :room, 2, services: courtesy.services
    booking = FactoryGirl.create :booking, rooms: rooms, guest: guest, check_in: Date.today
    courtesies_use = FactoryGirl.create(:courtesies_use, courtesy: courtesy, booking: booking, used_at: booking.check_in)
    visit courtesy_path(courtesy)

    expect(page).to have_content courtesy.name
    expect(page).to have_content courtesy.description
    expect(page).to have_content courtesy.price

    expect(page).to have_content booking.guest.name
    expect(page).to have_content booking.guest.id
    expect(page).to have_content booking.guest.phone
    expect(page).to have_content booking.guest.email

    courtesy.services.each do |service|
      expect(page).to have_content service.name
    end
  end

  scenario 'I can destroy a courtesy' do
    login_as FactoryGirl.create(:user), scope: :user

    courtesy = FactoryGirl.create :courtesy, services: FactoryGirl.create_list(:service, 2)

    visit courtesies_path

    find("a[href='#{courtesy_path(courtesy)}'][data-method='delete']").click

    expect(current_path).to eq courtesies_path
    expect(page).to have_content 'Produto-cortesia excluído com sucesso!'

    expect(Courtesy.count).to eq 0
    expect(courtesy.services.reload.count).to eq 0
  end

  scenario 'I can list all courtesies' do
    login_as FactoryGirl.create(:user), scope: :user

    courtesies = FactoryGirl.create_list :courtesy, 2

    visit courtesies_path

    courtesies.each do |courtesy|
      expect(page).to have_content courtesy.id
      expect(page).to have_content courtesy.name
      expect(page).to have_content courtesy.description
      expect(page).to have_content courtesy.price
    end
  end
end
