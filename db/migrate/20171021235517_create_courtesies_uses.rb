class CreateCourtesiesUses < ActiveRecord::Migration[5.1]
  def change
    create_table :courtesies_uses do |t|
      t.references :booking, index: true, foreign_key: true
      t.references :courtesy, index: true, foreign_key: true
      t.date :used_at
      t.timestamps
    end
  end
end
