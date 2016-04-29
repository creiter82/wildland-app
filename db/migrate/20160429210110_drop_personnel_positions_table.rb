class DropPersonnelPositionsTable < ActiveRecord::Migration
  def change
    drop_table :personnel_positions
  end
end
