class AddColumnToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :name, :string
    add_column :employees, :dob, :date
    add_column :employees, :qualification, :string
    add_column :employees, :contact, :string
    add_column :employees, :gender, :string
  end
end
