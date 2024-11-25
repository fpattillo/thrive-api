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

ActiveRecord::Schema[7.2].define(version: 2024_09_15_232442) do
  create_table "periods", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.integer "completion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subtasks", force: :cascade do |t|
    t.integer "task_id", null: false
    t.string "name"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_subtasks_on_task_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "task_id", null: false
    t.string "name"
    t.string "color_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_tags_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "period_id", null: false
    t.string "variant"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "progress", default: 0
    t.integer "goal", default: 100
    t.index ["period_id"], name: "index_tasks_on_period_id"
  end

  add_foreign_key "subtasks", "tasks"
  add_foreign_key "tags", "tasks"
  add_foreign_key "tasks", "periods"
end
