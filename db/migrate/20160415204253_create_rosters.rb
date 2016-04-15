class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.text :name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
