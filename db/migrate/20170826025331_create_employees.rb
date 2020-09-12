class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone
      t.string :office
      t.timestamps
    end
  end
end
