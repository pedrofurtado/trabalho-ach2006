class AddBookingToMealsUses < ActiveRecord::Migration[5.1]
  def change
    add_reference :meals_uses, :booking, foreign_key: true
  end
end
