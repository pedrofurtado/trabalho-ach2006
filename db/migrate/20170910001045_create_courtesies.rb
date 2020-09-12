class CreateCourtesies < ActiveRecord::Migration[5.1]
  def change
    create_table :courtesies do |t|
      t.string :name
      t.string :description
      t.float :price
      t.timestamps
    end
  end
end
