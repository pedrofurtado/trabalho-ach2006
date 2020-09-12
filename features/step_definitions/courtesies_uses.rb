When('I go to the new courtesy use page') do
  @courtesies_use = FactoryGirl.build :courtesies_use
  visit new_courtesies_use_path
end

When('I fill the courtesy use form and submit') do
  select @courtesies_use.booking.to_label, from: 'courtesies_use[booking_id]'
  select @courtesies_use.courtesy.name, from: 'courtesies_use[courtesy_id]'
  select @courtesies_use.used_at.day, from: 'courtesies_use[used_at(3i)]'
  select I18n.t('date.month_names')[@courtesies_use.used_at.month], from: 'courtesies_use[used_at(2i)]'
  select @courtesies_use.used_at.year, from: 'courtesies_use[used_at(1i)]'
  find('input[type="submit"]').click
end

Then('I go to the courtesies uses page') do
  expect(current_path).to eq courtesies_uses_path
end

Then('I will see a success message courtesy use') do
  expect(page).to have_content 'Uso do Produto-Cortesia criado com sucesso!'
end

Then('I will have the new courtesy use created in database') do
  expected_courtesies_use = CourtesiesUse.last
  expect(expected_courtesies_use.booking.id).to eq @courtesies_use.booking.id
  expect(expected_courtesies_use.courtesy.id).to eq @courtesies_use.courtesy.id
  expect(expected_courtesies_use.used_at).to eq @courtesies_use.used_at
end

When('I go to the edit page of a courtesy use') do
  @courtesies_use_in_edition = FactoryGirl.create :courtesies_use
  @courtesies_use = FactoryGirl.build :courtesies_use
  visit edit_courtesies_use_path(@courtesies_use_in_edition)
end

Then('I go to the courtesy use page') do
  expect(current_path).to eq courtesies_uses_path
end

Then('I will see a success message of updating courtesy use') do
  expect(page).to have_content 'Uso do Produto-Cortesia atualizado com sucesso!'
end

Then('I will have the courtesy use updated in database') do
  expected_courtesies_use = CourtesiesUse.find(@courtesies_use_in_edition.id)
  expect(expected_courtesies_use.booking.id).to eq @courtesies_use.booking.id
  expect(expected_courtesies_use.courtesy.id).to eq @courtesies_use.courtesy.id
  expect(expected_courtesies_use.used_at).to eq @courtesies_use.used_at
end

When('I go to the show page of a courtesy use') do
  @courtesies_use = FactoryGirl.create :courtesies_use
  visit courtesies_use_path(@courtesies_use)
end

Then('I want to see the informations about courtesy use') do
  expect(page).to have_content @courtesies_use.booking.to_label
  expect(page).to have_content @courtesies_use.courtesy.name
  expect(page).to have_content I18n.l @courtesies_use.used_at
end

When('I go to the index page of courtesies uses') do
  @courtesies_use = FactoryGirl.create :courtesies_use
  visit courtesies_uses_path
end

When('I click on destroy courtesy use button') do
  find("a[href='#{courtesies_use_path(@courtesies_use)}'][data-method='delete']").click
end

Then('I am redirected again to index page of courtesies uses') do
  expect(current_path).to eq courtesies_uses_path
end

Then('I see a success message of destroying courtesy use') do
  expect(page).to have_content 'Uso do Produto-Cortesia excluído com sucesso!'
end

Then('I destroy the courtesy use from database') do
  expect(CourtesiesUse.count).to eq 0
end

When('I go to the index page of all courtesies uses') do
  @courtesies_uses = FactoryGirl.create_list :courtesies_use, 2
  visit courtesies_uses_path
end

Then('I want to see the informations about all courtesies uses') do
  @courtesies_uses.each do |courtesies_use|
    expect(page).to have_content courtesies_use.id
    expect(page).to have_content courtesies_use.booking.to_label
    expect(page).to have_content courtesies_use.courtesy.name
    expect(page).to have_content I18n.l courtesies_use.used_at
  end
end
