class AddRoomToCleaningRooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :cleaning_rooms, :room, index: true, foreign_key: true
  end
end
