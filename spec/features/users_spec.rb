describe 'As a User' do
  scenario 'I can edit my own account' do
    user = FactoryGirl.create(:user)
    login_as user, scope: :user

    new_user = FactoryGirl.build :user, email: user.email

    visit edit_user_path(user)

    fill_in 'user[email]', with: new_user.email
    find('input[type="submit"]').click

    expect(current_path).to eq users_path
    expect(page).to have_content 'Usuário atualizado com sucesso!'

    expected_user = User.find(user.id)
    expect(expected_user.email).to eq new_user.email
  end

  scenario 'I cannot edit another accounts' do
    login_as FactoryGirl.create(:user), scope: :user

    user = FactoryGirl.create(:user)

    visit edit_user_path(user)

    expect(current_path).to eq root_path
    expect(page).to have_content 'Você só pode alterar a sua própria conta de Usuário!'
  end

  scenario 'I can show a user' do
    login_as FactoryGirl.create(:user), scope: :user

    user = FactoryGirl.create :user

    visit user_path(user)

    expect(page).to have_content user.id
    expect(page).to have_content user.email
  end

  scenario 'I can list all users' do
    login_as FactoryGirl.create(:user), scope: :user

    users = FactoryGirl.create_list :user, 2

    visit users_path

    users.each do |user|
      expect(page).to have_content user.id
      expect(page).to have_content user.email
    end
  end
end
