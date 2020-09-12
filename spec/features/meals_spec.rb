describe 'As a User' do
  scenario 'I can create a new meal' do
    login_as FactoryGirl.create(:user), scope: :user

    meal = FactoryGirl.build :meal

    visit new_meal_path

    fill_in 'meal[name]', with: meal.name
    fill_in 'meal[price]', with: meal.price
    find('input[type="submit"]').click

    expect(current_path).to eq meals_path
    expect(page).to have_content 'Refeição criada com sucesso!'

    expected_meal = Meal.last
    expect(expected_meal.name).to eq meal.name
    expect(expected_meal.price).to eq meal.price
  end

  scenario 'I can edit a meal' do
    login_as FactoryGirl.create(:user), scope: :user

    meal = FactoryGirl.create :meal
    new_meal = FactoryGirl.build :meal

    visit edit_meal_path(meal)

    fill_in 'meal[name]', with: new_meal.name
    fill_in 'meal[price]', with: new_meal.price
    find('input[type="submit"]').click

    expect(current_path).to eq meals_path
    expect(page).to have_content 'Refeição atualizada com sucesso!'

    expected_meal = Meal.find(meal.id)
    expect(expected_meal.name).to eq new_meal.name
    expect(expected_meal.price).to eq new_meal.price
  end

  scenario 'I can show a meal' do
    login_as FactoryGirl.create(:user), scope: :user

    meal = FactoryGirl.create :meal
    guest = FactoryGirl.create :guest
    rooms = FactoryGirl.create_list :room, 2
    booking = FactoryGirl.create :booking, rooms: rooms, guest: guest, check_in: Date.today
    meals_uses = FactoryGirl.create :meals_use, meal: meal, booking: booking, used_at: Date.today

    visit meal_path(meal)

    expect(page).to have_content meal.name
    expect(page).to have_content meal.price
    expect(page).to have_content guest.id
    expect(page).to have_content guest.name
    expect(page).to have_content guest.phone
    expect(page).to have_content guest.email
  end

  scenario 'I can destroy a meal' do
    login_as FactoryGirl.create(:user), scope: :user

    meal = FactoryGirl.create :meal

    visit meals_path

    find("a[href='#{meal_path(meal)}'][data-method='delete']").click

    expect(current_path).to eq meals_path
    expect(page).to have_content 'Refeição excluída com sucesso!'

    expect(Meal.count).to eq 0
  end

  scenario 'I can list all meals' do
    login_as FactoryGirl.create(:user), scope: :user

    meals = FactoryGirl.create_list :meal, 2

    visit meals_path

    meals.each do |meal|
      expect(page).to have_content meal.id
      expect(page).to have_content meal.name
      expect(page).to have_content meal.price
    end
  end
end
