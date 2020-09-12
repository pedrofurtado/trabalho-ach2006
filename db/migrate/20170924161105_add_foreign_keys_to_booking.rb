class AddForeignKeysToBooking < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :bookings, :rooms
    add_foreign_key :bookings, :guests
  end
end
