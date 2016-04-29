class CreatePersonnelPositions < ActiveRecord::Migration
  def change
    create_table :personnel_positions do |t|
      t.integer :personnel_id
      t.integer :position_id

      t.timestamps null: false
    end
  end
end
