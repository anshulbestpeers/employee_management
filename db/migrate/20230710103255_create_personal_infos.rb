class CreatePersonalInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_infos do |t|
      t.string :father_name
      t.string :mother_name
      t.date :dob
      t.string :personal_contact
      t.string :emergency_contact
      t.string :blood_group
      t.string :present_address
      t.string :permanent_address
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
