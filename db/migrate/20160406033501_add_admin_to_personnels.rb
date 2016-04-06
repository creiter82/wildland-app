class AddAdminToPersonnels < ActiveRecord::Migration
  def change
    add_column :personnels, :admin, :boolean, default: false
  end
end
