class AddMealToMealsUses < ActiveRecord::Migration[5.1]
  def change
    add_reference :meals_uses, :meal, index: true, foreign_key: true
  end
end
