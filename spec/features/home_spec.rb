describe 'As a User' do
  context 'In the homepage of system' do
    scenario 'I can see some basic informations about Hotel' do
      login_as FactoryGirl.create(:user), scope: :user

      users = FactoryGirl.create_list :user, 2
      guests = FactoryGirl.create_list :guest, 2

      visit root_path

      expect(page).to have_content 'Bem-Vindo à página inicial do MyHotel!'

      within '.info-box-of-guests' do
        expect(page).to have_content 'Hóspedes'
        expect(page).to have_content guests.size
      end

      within '.info-box-of-users' do
        expect(page).to have_content 'Usuários'
        expect(page).to have_content users.size + 1
      end

      within '.info-box-of-rooms' do
        expect(page).to have_content 'Quartos'
        expect(page).to have_content 0
      end

      within '.info-box-of-employees' do
        expect(page).to have_content 'Funcionários'
        expect(page).to have_content 0
      end

      within '.info-box-of-environments' do
        expect(page).to have_content 'Ambientes'
        expect(page).to have_content 0
      end

      within '.info-box-of-services' do
        expect(page).to have_content 'Serviços'
        expect(page).to have_content 0
      end

      within '.info-box-of-courtesies' do
        expect(page).to have_content 'Produtos-cortesia'
        expect(page).to have_content 0
      end
    end
  end
end
