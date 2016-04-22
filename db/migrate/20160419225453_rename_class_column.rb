class RenameClassColumn < ActiveRecord::Migration
  def change
    rename_column :apparatus, :class, :apparatus_class
  end
end
