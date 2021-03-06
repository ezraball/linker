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

ActiveRecord::Schema.define(version: 20170208225857) do

  create_table "clips", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "quote"
    t.text     "commentary"
    t.string   "link"
    t.datetime "link_date"
    t.datetime "pub_date"
    t.string   "source_name"
    t.string   "source_url"
    t.string   "fetch_response"
    t.datetime "fetch_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "fetch_body"
  end

end
