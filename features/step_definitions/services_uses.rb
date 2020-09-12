When('I go to the new service use page') do
  @services_use = FactoryGirl.build :services_use
  visit new_services_use_path
end

When('I fill the service use form and submit') do
  select @services_use.booking.to_label, from: 'services_use[booking_id]'
  select @services_use.service.name, from: 'services_use[service_id]'
  select @services_use.used_at.day, from: 'services_use[used_at(3i)]'
  select I18n.t('date.month_names')[@services_use.used_at.month], from: 'services_use[used_at(2i)]'
  select @services_use.used_at.year, from: 'services_use[used_at(1i)]'
  find('input[type="submit"]').click
end

Then('I go to the services uses page') do
  expect(current_path).to eq services_uses_path
end

Then('I will see a success message') do
  expect(page).to have_content 'Uso do Serviço criado com sucesso!'
end

Then('I will have the new service use created in database') do
  expected_services_use = ServicesUse.last
  expect(expected_services_use.booking.id).to eq @services_use.booking.id
  expect(expected_services_use.service.id).to eq @services_use.service.id
  expect(expected_services_use.used_at).to eq @services_use.used_at
end

When('I go to the edit page of a service use') do
  @services_use_in_edition = FactoryGirl.create :services_use
  @services_use = FactoryGirl.build :services_use
  visit edit_services_use_path(@services_use_in_edition)
end

Then('I go to the service use page') do
  expect(current_path).to eq services_uses_path
end

Then('I will see a success message of updating') do
  expect(page).to have_content 'Uso do Serviço atualizado com sucesso!'
end

Then('I will have the service use updated in database') do
  expected_services_use = ServicesUse.find(@services_use_in_edition.id)
  expect(expected_services_use.booking.id).to eq @services_use.booking.id
  expect(expected_services_use.service.id).to eq @services_use.service.id
  expect(expected_services_use.used_at).to eq @services_use.used_at
end

When('I go to the show page of a service use') do
  @services_use = FactoryGirl.create :services_use
  visit services_use_path(@services_use)
end

Then('I want to see the informations about service use') do
  expect(page).to have_content @services_use.booking.to_label
  expect(page).to have_content @services_use.service.name
  expect(page).to have_content I18n.l @services_use.used_at
end

When('I go to the index page of services uses') do
  @services_use = FactoryGirl.create :services_use
  visit services_uses_path
end

When('I click on destroy button') do
  find("a[href='#{services_use_path(@services_use)}'][data-method='delete']").click
end

Then('I am redirected again to index page of services uses') do
  expect(current_path).to eq services_uses_path
end

Then('I see a success message of destroying') do
  expect(page).to have_content 'Uso do Serviço excluído com sucesso!'
end

Then('I destroy the service use from database') do
  expect(ServicesUse.count).to eq 0
end

When('I go to the index page of all services uses') do
  @services_uses = FactoryGirl.create_list :services_use, 2
  visit services_uses_path
end

Then('I want to see the informations about all services uses') do
  @services_uses.each do |services_use|
    expect(page).to have_content services_use.id
    expect(page).to have_content services_use.booking.to_label
    expect(page).to have_content services_use.service.name
    expect(page).to have_content I18n.l services_use.used_at
  end
end
