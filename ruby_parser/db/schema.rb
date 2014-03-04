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

ActiveRecord::Schema.define(version: 20140222210939) do

  create_table "aquizitions", force: true do |t|
    t.text     "file_lines"
    t.string   "winner"
    t.string   "winner_cui"
    t.string   "winner_country"
    t.string   "winner_city"
    t.string   "procurement_type"
    t.string   "contract_authority"
    t.string   "contract_authority_cui"
    t.string   "notice_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fields_size"
  end

  create_table "aquizitions_raw", id: false, force: true do |t|
    t.text "file_lines"
  end

end
