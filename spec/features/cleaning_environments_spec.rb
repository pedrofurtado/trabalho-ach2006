def fill_cleaning_environment_form(cleaning_environment)
  select cleaning_environment.cleaning_date.day, from: 'cleaning_environment[cleaning_date(3i)]'
  select I18n.t('date.month_names')[cleaning_environment.cleaning_date.month], from: 'cleaning_environment[cleaning_date(2i)]'
  select cleaning_environment.cleaning_date.year, from: 'cleaning_environment[cleaning_date(1i)]'
  select cleaning_environment.environment.name, from: 'cleaning_environment[environment_id]'
  find('input[type="submit"]').click
end

describe 'As a User' do
  scenario 'I can create a new cleaning environment' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_environment = FactoryGirl.build :cleaning_environment

    visit new_cleaning_environment_path

    fill_cleaning_environment_form(cleaning_environment)

    expect(current_path).to eq cleaning_environments_path
    expect(page).to have_content 'Limpeza de Ambiente criado com sucesso!'

    expected_cleaning_environment = CleaningEnvironment.last
    expect(expected_cleaning_environment.cleaning_date).to eq cleaning_environment.cleaning_date
    expect(expected_cleaning_environment.environment.id).to eq cleaning_environment.environment.id
  end

  scenario 'I can edit a cleaning environment' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_environment = FactoryGirl.create :cleaning_environment
    new_cleaning_environment = FactoryGirl.build :cleaning_environment

    visit edit_cleaning_environment_path(cleaning_environment)

    fill_cleaning_environment_form(new_cleaning_environment)

    expect(current_path).to eq cleaning_environments_path
    expect(page).to have_content 'Limpeza de Ambiente atualizado com sucesso!'

    expected_cleaning_environment = CleaningEnvironment.find(cleaning_environment.id)
    expect(expected_cleaning_environment.cleaning_date).to eq new_cleaning_environment.cleaning_date
    expect(expected_cleaning_environment.environment.id).to eq new_cleaning_environment.environment.id
  end

  scenario 'I can show a cleaning environment' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_environment = FactoryGirl.create :cleaning_environment

    visit cleaning_environment_path(cleaning_environment)

    expect(page).to have_content cleaning_environment.id
    expect(page).to have_content I18n.l cleaning_environment.cleaning_date
    expect(page).to have_content cleaning_environment.environment.name
  end

  scenario 'I can destroy a cleaning environment' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_environment = FactoryGirl.create :cleaning_environment

    visit cleaning_environments_path

    find("a[href*='#{cleaning_environment_path(cleaning_environment)}'][data-method='delete']").click

    expect(current_path).to eq cleaning_environments_path
    expect(page).to have_content 'Limpeza de Ambiente excluído com sucesso!'

    expect(CleaningEnvironment.count).to eq 0
  end

  scenario 'I can list all cleaning environments' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_environments = FactoryGirl.create_list :cleaning_environment, 2

    visit cleaning_environments_path

    cleaning_environments.each do |cleaning_environment|
      expect(page).to have_content cleaning_environment.id
      expect(page).to have_content I18n.l cleaning_environment.cleaning_date
      expect(page).to have_content cleaning_environment.environment.name
    end
  end
end
