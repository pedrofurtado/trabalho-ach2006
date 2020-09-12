class CreateJoinTableServicesCourtesies < ActiveRecord::Migration[5.1]
  def change
    create_table :courtesies_services do |t|
      t.references :courtesy, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.timestamps
    end
  end
end
