# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_04_100958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "next_question_id"
    t.bigint "question_id", null: false
    t.string "value"
    t.boolean "input", default: false
    t.float "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["next_question_id"], name: "index_answers_on_next_question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "iteration_answers", force: :cascade do |t|
    t.bigint "iteration_id", null: false
    t.bigint "question_id", null: false
    t.bigint "answer_id", null: false
    t.string "value"
    t.index ["answer_id"], name: "index_iteration_answers_on_answer_id"
    t.index ["iteration_id"], name: "index_iteration_answers_on_iteration_id"
    t.index ["question_id"], name: "index_iteration_answers_on_question_id"
  end

  create_table "iterations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_iterations_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "entry", default: false
    t.string "identifier"
    t.boolean "multiple"
    t.boolean "other"
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.integer "priority"
    t.index ["answer_id"], name: "index_recommendations_on_answer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "questions", column: "next_question_id"
  add_foreign_key "iteration_answers", "answers"
  add_foreign_key "iteration_answers", "iterations"
  add_foreign_key "iteration_answers", "questions"
  add_foreign_key "iterations", "users"
  add_foreign_key "recommendations", "answers"
end
