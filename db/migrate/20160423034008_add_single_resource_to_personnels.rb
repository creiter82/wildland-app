class AddSingleResourceToPersonnels < ActiveRecord::Migration
  def change
    add_column :personnels, :single_resource, :boolean, null: false, default: false
  end
end
