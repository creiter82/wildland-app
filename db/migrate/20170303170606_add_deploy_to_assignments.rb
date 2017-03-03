class AddDeployToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :deploy, :boolean, :default => false
  end
end
