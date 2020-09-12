class CreateJoinTableRoomsBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings_rooms do |t|
      t.references :booking, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.timestamps
    end
  end
end
