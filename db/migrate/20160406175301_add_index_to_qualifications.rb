class AddIndexToQualifications < ActiveRecord::Migration
  def change
    add_index :qualifications, :name, unique: true
  end
end
