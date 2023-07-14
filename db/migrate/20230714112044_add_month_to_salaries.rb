class AddMonthToSalaries < ActiveRecord::Migration[7.0]
  def change
    add_column :salaries, :month, :string
  end
end
