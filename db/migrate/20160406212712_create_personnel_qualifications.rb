class CreatePersonnelQualifications < ActiveRecord::Migration
  def change
    create_table :personnel_qualifications do |t|
      t.integer :personnel_id
      t.integer :qualification_id

      t.timestamps null: false
    end
  end
end
