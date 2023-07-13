class AddDaysToLeaves < ActiveRecord::Migration[7.0]
  def change
    add_column :leaves, :days, :integer
  end
end
