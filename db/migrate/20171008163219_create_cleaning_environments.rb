class CreateCleaningEnvironments < ActiveRecord::Migration[5.1]
  def change
    create_table :cleaning_environments do |t|
      t.date :cleaning_date
      t.references :environment, index: true, foreign_key: true
      t.timestamps
    end
  end
end
