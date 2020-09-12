class RemoveRoomIdFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :room_id
  end
end
