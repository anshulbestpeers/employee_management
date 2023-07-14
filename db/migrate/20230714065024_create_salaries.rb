class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.integer :yearly_package
      t.integer :monthly_income
      t.integer :net_income
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
