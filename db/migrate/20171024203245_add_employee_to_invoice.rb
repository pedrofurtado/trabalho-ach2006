class AddEmployeeToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :employee, index: true, foreign_key: true
  end
end
