class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.float :total_value
      t.string :payment_type
      t.references :booking, index: true, foreign_key: true

      t.timestamps
    end
  end
end
