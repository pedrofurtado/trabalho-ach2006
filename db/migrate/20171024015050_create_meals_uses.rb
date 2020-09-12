class CreateMealsUses < ActiveRecord::Migration[5.1]
  def change
    create_table :meals_uses do |t|
      t.date :used_at

      t.timestamps
    end
  end
end
