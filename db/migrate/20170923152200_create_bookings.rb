class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.belongs_to :room, null: false
      t.belongs_to :guest, null: false
      t.timestamps
    end
  end
end
