class AddAcronymToQualifications < ActiveRecord::Migration
  def change
    add_column :qualifications, :acronym, :string
  end
end
