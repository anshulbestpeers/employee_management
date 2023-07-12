class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.integer :leave_type
      t.date :from_date
      t.integer :from_session
      t.date :to_date
      t.integer :to_session
      t.string :mail_to
      t.string :reason

      t.timestamps
    end
  end
end
