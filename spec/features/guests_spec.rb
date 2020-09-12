describe 'As a User' do
  scenario 'I can create a new guest' do
    login_as FactoryGirl.create(:user), scope: :user

    guest = FactoryGirl.build :guest

    visit new_guest_path

    fill_in 'guest[name]', with: guest.name
    fill_in 'guest[phone]', with: guest.phone
    fill_in 'guest[email]', with: guest.email
    find('input[type="submit"]').click

    expect(current_path).to eq guests_path
    expect(page).to have_content 'Hóspede criado com sucesso!'

    expected_guest = Guest.last
    expect(expected_guest.name).to eq guest.name
    expect(expected_guest.phone).to eq guest.phone
    expect(expected_guest.email).to eq guest.email
  end

  scenario 'I can edit a guest' do
    login_as FactoryGirl.create(:user), scope: :user

    guest = FactoryGirl.create :guest
    new_guest = FactoryGirl.build :guest

    visit edit_guest_path(guest)
    fill_in 'guest[name]', with: new_guest.name
    fill_in 'guest[phone]', with: new_guest.phone
    fill_in 'guest[email]', with: new_guest.email
    find('input[type="submit"]').click

    expect(current_path).to eq guests_path
    expect(page).to have_content 'Hóspede atualizado com sucesso!'

    expected_guest = Guest.find(guest.id)
    expect(expected_guest.name).to eq new_guest.name
    expect(expected_guest.phone).to eq new_guest.phone
    expect(expected_guest.email).to eq new_guest.email
  end

  scenario 'I can show a guest' do
    login_as FactoryGirl.create(:user), scope: :user

    guest = FactoryGirl.create :guest
    booking = FactoryGirl.create :booking, guest: guest

    visit guest_path(guest)

    expect(page).to have_content guest.name
    expect(page).to have_content guest.phone
    expect(page).to have_content guest.email

    expect(page).to have_content booking.id
    expect(page).to have_content I18n.l(booking.check_in)
    expect(page).to have_content I18n.l(booking.check_out)
    expect(page).to have_content booking.companions
  end

  scenario 'I can destroy a guest' do
    login_as FactoryGirl.create(:user), scope: :user

    guest = FactoryGirl.create :guest

    visit guests_path

    find("a[href='#{guest_path(guest)}'][data-method='delete']").click

    expect(current_path).to eq guests_path
    expect(page).to have_content 'Hóspede excluído com sucesso!'

    expect(Guest.count).to eq 0
  end

  scenario 'I can list all guests' do
    login_as FactoryGirl.create(:user), scope: :user

    guests = FactoryGirl.create_list :guest, 2

    visit guests_path

    guests.each do |guest|
      expect(page).to have_content guest.id
      expect(page).to have_content guest.name
      expect(page).to have_content guest.phone
      expect(page).to have_content guest.email
    end
  end
end
