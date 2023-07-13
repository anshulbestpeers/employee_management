class DropDaysToLeaves < ActiveRecord::Migration[7.0]
  def change
    remove_column :leaves, :days
  end
end
