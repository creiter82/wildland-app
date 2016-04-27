class CreateApparatuPositions < ActiveRecord::Migration
  def change
    create_table :apparatu_positions do |t|
      t.integer :apparatu_id
      t.integer :position_id

      t.timestamps null: false
    end
  end
end
