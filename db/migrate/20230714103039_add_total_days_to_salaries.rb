class AddTotalDaysToSalaries < ActiveRecord::Migration[7.0]
  def change
    add_column :salaries, :total_leaves, :integer
  end
end
