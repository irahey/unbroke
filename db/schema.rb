# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151029235110) do

  create_table "quizzes", force: :cascade do |t|
    t.float    "income",           default: 0.0
    t.float    "other_bills",      default: 0.0
    t.float    "car_bills",        default: 0.0
    t.float    "house_bills",      default: 0.0
    t.float    "leisure",          default: 0.0
    t.float    "house_value",      default: 0.0
    t.float    "car_value",        default: 0.0
    t.float    "investments",      default: 0.0
    t.float    "esavings",         default: 0.0
    t.float    "rsavings",         default: 0.0
    t.float    "student_loan",     default: 0.0
    t.float    "personal_loan",    default: 0.0
    t.float    "medical_loan",     default: 0.0
    t.float    "car_loan",         default: 0.0
    t.boolean  "debt_repay",       default: false
    t.float    "debt_repay_value", default: 0.0
    t.string   "email"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
