class AddAlternateToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :alternate, :boolean, :default => false
  end
end
