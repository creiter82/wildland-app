class AddNameIndexToPositions < ActiveRecord::Migration
  def change
    add_index :positions, :name, :unique => true
  end
end
