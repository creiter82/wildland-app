class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :apparatu
      t.references :personnel
      t.references :roster
      t.references :position
    end
  end
end
