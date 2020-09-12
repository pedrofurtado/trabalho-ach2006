class AddCompanionsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :companions, :integer, default: 0
  end
end
