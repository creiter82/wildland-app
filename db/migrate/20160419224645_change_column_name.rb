class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :apparatus, :name, :designator
    add_column :apparatus, :class, :text
  end
end
