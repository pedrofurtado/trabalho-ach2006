describe 'As a User' do
  scenario 'I can create a new employee' do
    login_as FactoryGirl.create(:user), scope: :user

    employee = FactoryGirl.build :employee

    visit new_employee_path

    fill_in 'employee[name]', with: employee.name
    fill_in 'employee[phone]', with: employee.phone
    fill_in 'employee[office]', with: employee.office
    find('input[type="submit"]').click

    expect(current_path).to eq employees_path
    expect(page).to have_content 'Funcionário criado com sucesso!'

    expected_employee = Employee.last
    expect(expected_employee.name).to eq employee.name
    expect(expected_employee.phone).to eq employee.phone
    expect(expected_employee.office).to eq employee.office
  end

  scenario 'I can edit a employee' do
    login_as FactoryGirl.create(:user), scope: :user

    employee = FactoryGirl.create :employee
    new_employee = FactoryGirl.build :employee

    visit edit_employee_path(employee)

    fill_in 'employee[name]', with: new_employee.name
    fill_in 'employee[phone]', with: new_employee.phone
    fill_in 'employee[office]', with: new_employee.office
    find('input[type="submit"]').click

    expect(current_path).to eq employees_path
    expect(page).to have_content 'Funcionário atualizado com sucesso!'

    expected_employee = Employee.find(employee.id)
    expect(expected_employee.name).to eq new_employee.name
    expect(expected_employee.phone).to eq new_employee.phone
    expect(expected_employee.office).to eq new_employee.office
  end

  scenario 'I can show a employee' do
    login_as FactoryGirl.create(:user), scope: :user

    employee = FactoryGirl.create :employee
    invoice = FactoryGirl.create :invoice, employee: employee

    visit employee_path(employee)

    expect(page).to have_content employee.name
    expect(page).to have_content employee.phone
    expect(page).to have_content employee.office
    expect(page).to have_content invoice.id
    expect(page).to have_content invoice.total_value
    expect(page).to have_content invoice.payment_type
    expect(page).to have_content invoice.booking.to_label
  end
  
  scenario 'I can destroy a employee' do
    login_as FactoryGirl.create(:user), scope: :user

    employee = FactoryGirl.create :employee

    visit employees_path

    find("a[href='#{employee_path(employee)}'][data-method='delete']").click

    expect(current_path).to eq employees_path
    expect(page).to have_content 'Funcionário excluído com sucesso!'

    expect(Employee.count).to eq 0
  end

  scenario 'I can list all employees' do
    login_as FactoryGirl.create(:user), scope: :user

    employees = FactoryGirl.create_list :employee, 2

    visit employees_path

    employees.each do |employee|
      expect(page).to have_content employee.name
      expect(page).to have_content employee.phone
      expect(page).to have_content employee.office
    end
  end
end
