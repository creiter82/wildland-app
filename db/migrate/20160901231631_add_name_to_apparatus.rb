class AddNameToApparatus < ActiveRecord::Migration
  def change
    add_column :apparatus, :name, :string
  end
end
