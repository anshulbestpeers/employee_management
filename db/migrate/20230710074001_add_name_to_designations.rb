class AddNameToDesignations < ActiveRecord::Migration[7.0]
  def change
    add_column :designations, :name, :string
  end
end
