Given('I am logged') do
  login_as FactoryGirl.create(:user), scope: :user
end
