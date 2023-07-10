class AddDesignationReferenceToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :designation, null: false, foreign_key: true
  end
end
