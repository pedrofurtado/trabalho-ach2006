class CreateJoinTableServiceRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms_services do |t|
       t.references :room, index: true, foreign_key: true
       t.references :service, index: true, foreign_key: true
       t.timestamps
    end
  end
end
