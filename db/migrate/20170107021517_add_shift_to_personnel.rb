class AddShiftToPersonnel < ActiveRecord::Migration
  def change
    add_column :personnels, :shift, :string
  end
end
