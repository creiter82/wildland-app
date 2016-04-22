class AddApparatusTypeToApparatus < ActiveRecord::Migration
  def change
    add_column :apparatus, :apparatus_type, :integer
  end
end
