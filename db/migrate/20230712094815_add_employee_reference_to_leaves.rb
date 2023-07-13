class AddEmployeeReferenceToLeaves < ActiveRecord::Migration[7.0]
  def change
    add_reference :leaves, :employee, null: false, foreign_key: true
    change_column :leaves, :leave_type, :integer, default: 0
    add_column :leaves, :status, :integer, default: 0
  end
end
