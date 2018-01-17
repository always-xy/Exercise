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

ActiveRecord::Schema.define(version: 20170831021843) do

  create_table "people", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "people_num", limit: 100, default: "", comment: "人员编号"
    t.string "people_name", limit: 100, default: "", comment: "人员姓名"
    t.string "people_mobile", limit: 100, default: "", comment: "人员电话"
    t.integer "vote_num", default: 0, comment: "投票数量"
    t.string "note", limit: 100, default: "", comment: "备注"
    t.string "approve_flag", limit: 100, default: "", comment: "审核"
    t.string "pic_url_file_name"
    t.string "pic_url_content_type"
    t.integer "pic_url_file_size"
    t.datetime "pic_url_updated_at"
    t.string "status_code", limit: 30, default: "ENABLED"
    t.string "created_by", limit: 22
    t.string "updated_by", limit: 22
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
