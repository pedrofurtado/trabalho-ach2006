When('I go to the new environment use page') do
  @environments_use = FactoryGirl.build :environments_use
  visit new_environments_use_path
end

When('I fill the environment use form and submit') do
  select @environments_use.booking.to_label, from: 'environments_use[booking_id]'
  select @environments_use.environment.name, from: 'environments_use[environment_id]'
  select @environments_use.used_at.day, from: 'environments_use[used_at(3i)]'
  select I18n.t('date.month_names')[@environments_use.used_at.month], from: 'environments_use[used_at(2i)]'
  select @environments_use.used_at.year, from: 'environments_use[used_at(1i)]'
  find('input[type="submit"]').click
end

Then('I go to the environments uses page') do
  expect(current_path).to eq environments_uses_path
end

Then('I will see a success message of environment created') do
  expect(page).to have_content 'Uso do Ambiente criado com sucesso!'
end

Then('I will have the new environment use created in database') do
  expected_environments_use = EnvironmentsUse.last
  expect(expected_environments_use.booking.id).to eq @environments_use.booking.id
  expect(expected_environments_use.environment.id).to eq @environments_use.environment.id
  expect(expected_environments_use.used_at).to eq @environments_use.used_at
end

When('I go to the edit page of a environment use') do
  @environments_use_in_edition = FactoryGirl.create :environments_use
  @environments_use = FactoryGirl.build :environments_use
  visit edit_environments_use_path(@environments_use_in_edition)
end

Then('I go to the environment use page') do
  expect(current_path).to eq environments_uses_path
end

Then('I will see a success message of environments use of updating') do
  expect(page).to have_content 'Uso do Ambiente atualizado com sucesso!'
end

Then('I will have the environment use updated in database') do
  expected_environments_use = EnvironmentsUse.find(@environments_use_in_edition.id)
  expect(expected_environments_use.booking.id).to eq @environments_use.booking.id
  expect(expected_environments_use.environment.id).to eq @environments_use.environment.id
  expect(expected_environments_use.used_at).to eq @environments_use.used_at
end

When('I go to the show page of a environment use') do
  @environments_use = FactoryGirl.create :environments_use
  visit environments_use_path(@environments_use)
end

Then('I want to see the informations about environment use') do
  expect(page).to have_content @environments_use.booking.to_label
  expect(page).to have_content @environments_use.environment.name
  expect(page).to have_content I18n.l @environments_use.used_at
end

When('I go to the index page of environments uses') do
  @environments_use = FactoryGirl.create :environments_use
  visit environments_uses_path
end

When('I click on destroy button to destroy an environment') do
  find("a[href='#{environments_use_path(@environments_use)}'][data-method='delete']").click
end

Then('I am redirected again to index page of environments uses') do
  expect(current_path).to eq environments_uses_path
end

Then('I see a success message of destroying a environment') do
  expect(page).to have_content 'Uso do Ambiente excluído com sucesso!'
end

Then('I destroy the environment use from database') do
  expect(EnvironmentsUse.count).to eq 0
end

When('I go to the index page of all environments uses') do
  @services_uses = FactoryGirl.create_list :environments_use, 2
  visit environments_uses_path
end

Then('I want to see the informations about all environments uses') do
  @services_uses.each do |environments_use|
    expect(page).to have_content environments_use.id
    expect(page).to have_content environments_use.booking.to_label
    expect(page).to have_content environments_use.environment.name
    expect(page).to have_content I18n.l environments_use.used_at
  end
end
