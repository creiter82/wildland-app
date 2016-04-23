class CreateRosterApparatus < ActiveRecord::Migration
  def change
    create_table :roster_apparatus do |t|
      t.integer :apparatu_id
      t.integer :roster_id

      t.timestamps null: false
    end
  end
end
