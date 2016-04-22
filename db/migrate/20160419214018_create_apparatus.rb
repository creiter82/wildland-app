class CreateApparatus < ActiveRecord::Migration
  def change
    create_table :apparatus do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
