describe 'As a User' do
  scenario 'I can create a new environment' do
    login_as FactoryGirl.create(:user), scope: :user

    environment = FactoryGirl.build :environment

    visit new_environment_path

    fill_in 'environment[name]', with: environment.name
    fill_in 'environment[description]', with: environment.description
    fill_in 'environment[price]', with: environment.price
    find('input[type="submit"]').click

    expect(current_path).to eq environments_path
    expect(page).to have_content 'Ambiente criado com sucesso!'

    expected_environment = Environment.last
    expect(expected_environment.name).to eq environment.name
    expect(expected_environment.description).to eq environment.description
    expect(expected_environment.price).to eq environment.price
  end

  scenario 'I can edit a environment' do
    login_as FactoryGirl.create(:user), scope: :user

    environment = FactoryGirl.create :environment
    new_environment = FactoryGirl.build :environment

    visit edit_environment_path(environment)

    fill_in 'environment[name]', with: new_environment.name
    fill_in 'environment[description]', with: new_environment.description
    fill_in 'environment[price]', with: new_environment.price
    find('input[type="submit"]').click

    expect(current_path).to eq environments_path
    expect(page).to have_content 'Ambiente atualizado com sucesso!'

    expected_environment = Environment.find(environment.id)
    expect(expected_environment.name).to eq new_environment.name
    expect(expected_environment.description).to eq new_environment.description
    expect(expected_environment.price).to eq new_environment.price
  end

  scenario 'I can show a environment' do
    login_as FactoryGirl.create(:user), scope: :user

    environment = FactoryGirl.create :environment
    guest = FactoryGirl.create :guest
    rooms = FactoryGirl.create_list :room, 2
    booking = FactoryGirl.create :booking, rooms: rooms, guest: guest, check_in: Date.today
    environments_uses = FactoryGirl.create :environments_use, environment: environment, booking: booking, used_at: Date.today
    cleaning_environment = FactoryGirl.create :cleaning_environment, environment: environment

    visit environment_path(environment)

    expect(page).to have_content environment.id
    expect(page).to have_content environment.name
    expect(page).to have_content environment.description
    expect(page).to have_content environment.price

    expect(page).to have_content guest.id
    expect(page).to have_content guest.name
    expect(page).to have_content guest.phone
    expect(page).to have_content guest.email

    expect(page).to have_content cleaning_environment.id
    expect(page).to have_content I18n.l(cleaning_environment.cleaning_date)
  end

  scenario 'I can destroy a environment' do
    login_as FactoryGirl.create(:user), scope: :user

    environment = FactoryGirl.create :environment

    visit environments_path

    find("a[href='#{environment_path(environment)}'][data-method='delete']").click

    expect(current_path).to eq environments_path
    expect(page).to have_content 'Ambiente excluído com sucesso!'

    expect(Environment.count).to eq 0
  end

  scenario 'I can list all environments' do
    login_as FactoryGirl.create(:user), scope: :user

    environments = FactoryGirl.create_list :environment, 2

    visit environments_path

    environments.each do |environment|
      expect(page).to have_content environment.id
      expect(page).to have_content environment.name
      expect(page).to have_content environment.description
      expect(page).to have_content environment.price
    end
  end
end
