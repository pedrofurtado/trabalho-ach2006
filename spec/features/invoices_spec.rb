describe 'As a User' do
  scenario 'I can create a new invoice' do
    login_as FactoryGirl.create(:user), score: :user

    invoice = FactoryGirl.build :invoice

    visit new_invoice_path

    fill_in 'invoice[total_value]', with: invoice.total_value
    fill_in 'invoice[payment_type]', with: invoice.payment_type
    select invoice.booking.to_label, from: 'invoice[booking_id]'
    select invoice.employee.name, from: 'invoice[employee_id]'

    find('input[type="submit"]').click

    expect(current_path).to eq invoices_path
    expect(page).to have_content 'Fatura criada com sucesso!'

    expected_invoice = Invoice.last
    expect(expected_invoice.payment_type).to eq invoice.payment_type
    expect(expected_invoice.total_value).to eq invoice.total_value
    expect(expected_invoice.booking.id).to eq invoice.booking.id
  end

  scenario 'I can show a invoice' do
    login_as FactoryGirl.create(:user), score: :user

    invoice = FactoryGirl.create :invoice

    visit invoice_path(invoice)

    expect(page).to have_content invoice.total_value
    expect(page).to have_content invoice.payment_type
    expect(page).to have_content invoice.booking.to_label
  end

  scenario 'I can destroy a invoice' do
    login_as FactoryGirl.create(:user), score: :user

    invoice = FactoryGirl.create :invoice

    visit invoices_path

    find("a[href*='#{invoice_path(invoice)}'][data-method='delete']").click

    expect(current_path).to eq invoices_path
    expect(page).to have_content 'Fatura excluída com sucesso!'

    expect(Invoice.count).to eq 0
  end

  scenario 'I can list all invoices' do
    login_as FactoryGirl.create(:user), scope: :user

    invoices = FactoryGirl.create_list :invoice, 2

    visit invoices_path

    invoices.each do |invoice|
      expect(page).to have_content invoice.total_value
      expect(page).to have_content invoice.payment_type
      expect(page).to have_content invoice.booking.to_label
    end
  end

  scenario 'I can edit a invoice' do
    login_as FactoryGirl.create(:user), scope: :user

    invoice = FactoryGirl.create :invoice
    new_invoice = FactoryGirl.build :invoice

    visit edit_invoice_path(invoice)

    fill_in 'invoice[total_value]', with: new_invoice.total_value
    fill_in 'invoice[payment_type]', with: new_invoice.payment_type
    select new_invoice.employee.name, from: 'invoice[employee_id]'

    find('input[type="submit"]').click

    expect(current_path).to eq invoices_path
    expect(page).to have_content 'Fatura atualizada com sucesso!'

    expected_invoice = Invoice.find(invoice.id)
    expect(expected_invoice.total_value).to eq new_invoice.total_value
    expect(expected_invoice.payment_type).to eq new_invoice.payment_type
  end
end
