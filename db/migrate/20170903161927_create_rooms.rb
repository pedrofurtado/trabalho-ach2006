class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :number, null: false
      t.integer :guest_limit, null: false
      t.timestamps
      t.index :number, unique: true
    end
  end
end
