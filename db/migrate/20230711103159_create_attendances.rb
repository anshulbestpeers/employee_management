class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.date :date
      t.time :in_time
      t.time :out_time
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
