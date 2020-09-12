When('I go to the new meal use page') do
  @meals_use = FactoryGirl.build :meals_use
  visit new_meals_use_path
end

When('I fill the meal use form and submit') do
  select @meals_use.booking.to_label, from: 'meals_use[booking_id]'
  select @meals_use.meal.name, from: 'meals_use[meal_id]'
  select @meals_use.used_at.day, from: 'meals_use[used_at(3i)]'
  select I18n.t('date.month_names')[@meals_use.used_at.month], from: 'meals_use[used_at(2i)]'
  select @meals_use.used_at.year, from: 'meals_use[used_at(1i)]'
  find('input[type="submit"]').click
end

Then('I go to the meals uses page') do
  expect(current_path).to eq meals_uses_path
end

Then('I will see a success message of meal_use') do
  expect(page).to have_content 'Consumo de Refeição criado com sucesso!'
end

Then('I will have the new meal use created in database') do
  expected_meals_use = MealsUse.last
  expect(expected_meals_use.booking.id).to eq @meals_use.booking.id
  expect(expected_meals_use.meal.id).to eq @meals_use.meal.id
  expect(expected_meals_use.used_at).to eq @meals_use.used_at
end

When('I go to the edit page of a meal use') do
  @meals_use_in_edition = FactoryGirl.create :meals_use
  @meals_use = FactoryGirl.build :meals_use
  visit edit_meals_use_path(@meals_use_in_edition)
end

Then('I go to the meal use page') do
  expect(current_path).to eq meals_uses_path
end

Then('I will see a success message of meal_use updating') do
  expect(page).to have_content 'Consumo de Refeição atualizado com sucesso!'
end

Then('I will have the meal use updated in database') do
  expected_meals_use = MealsUse.find(@meals_use_in_edition.id)
  expect(expected_meals_use.booking.id).to eq @meals_use.booking.id
  expect(expected_meals_use.meal.id).to eq @meals_use.meal.id
  expect(expected_meals_use.used_at).to eq @meals_use.used_at
end

When('I go to the show page of a meal use') do
  @meals_use = FactoryGirl.create :meals_use
  visit meals_use_path(@meals_use)
end

Then('I want to see the informations about meal use') do
  expect(page).to have_content @meals_use.booking.to_label
  expect(page).to have_content @meals_use.meal.name
  expect(page).to have_content I18n.l @meals_use.used_at
end

When('I go to the index page of meals uses') do
  @meals_use = FactoryGirl.create :meals_use
  visit meals_uses_path
end

When('I click on destroy meal_use button') do
  find("a[href='#{meals_use_path(@meals_use)}'][data-method='delete']").click
end

Then('I am redirected again to index page of meals uses') do
  expect(current_path).to eq meals_uses_path
end

Then('I see a success message of meal_use destroying') do
  expect(page).to have_content 'Consumo de Refeição excluído com sucesso!'
end

Then('I destroy the meal use from database') do
  expect(MealsUse.count).to eq 0
end

When('I go to the index page of all meals uses') do
  @meals_uses = FactoryGirl.create_list :meals_use, 2
  visit meals_uses_path
end

Then('I want to see the informations about all meals uses') do
  @meals_uses.each do |meals_use|
    expect(page).to have_content meals_use.id
    expect(page).to have_content meals_use.booking.to_label
    expect(page).to have_content meals_use.meal.name
    expect(page).to have_content I18n.l meals_use.used_at
  end
end
