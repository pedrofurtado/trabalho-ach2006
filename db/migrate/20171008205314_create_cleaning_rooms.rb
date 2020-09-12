class CreateCleaningRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :cleaning_rooms do |t|
      t.date :cleaning_date
      t.timestamps
    end
  end
end
