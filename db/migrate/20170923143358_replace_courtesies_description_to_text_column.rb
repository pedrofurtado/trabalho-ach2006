class ReplaceCourtesiesDescriptionToTextColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :courtesies, :description, :text
  end
end
