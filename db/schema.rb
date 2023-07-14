# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_14_103039) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.date "date"
    t.time "in_time"
    t.time "out_time"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_attendances_on_employee_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.date "dob"
    t.string "qualification"
    t.string "contact"
    t.string "gender"
    t.bigint "department_id", null: false
    t.bigint "designation_id", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["designation_id"], name: "index_employees_on_designation_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "employees_tasks", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employees_tasks_on_employee_id"
    t.index ["task_id"], name: "index_employees_tasks_on_task_id"
  end

  create_table "leaves", force: :cascade do |t|
    t.integer "leave_type", default: 0
    t.date "from_date"
    t.integer "from_session", default: 0
    t.date "to_date"
    t.integer "to_session", default: 0
    t.string "mail_to"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", null: false
    t.integer "status", default: 0
    t.integer "days"
    t.index ["employee_id"], name: "index_leaves_on_employee_id"
  end

  create_table "personal_infos", force: :cascade do |t|
    t.string "father_name"
    t.string "mother_name"
    t.date "dob"
    t.string "personal_contact"
    t.string "emergency_contact"
    t.string "blood_group"
    t.string "present_address"
    t.string "permanent_address"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_personal_infos_on_employee_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.integer "yearly_package"
    t.integer "monthly_income"
    t.integer "net_income"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_leaves"
    t.index ["employee_id"], name: "index_salaries_on_employee_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "start_date"
    t.date "due_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendances", "employees"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "designations"
  add_foreign_key "employees_tasks", "employees"
  add_foreign_key "employees_tasks", "tasks"
  add_foreign_key "leaves", "employees"
  add_foreign_key "personal_infos", "employees"
  add_foreign_key "salaries", "employees"
end
