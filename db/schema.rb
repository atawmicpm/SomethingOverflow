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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130628235852) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "url"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "product_name"
    t.string   "picture_url"
  end

  add_index "answers", ["url", "question_id"], :name => "index_answers_on_url_and_question_id", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.integer  "best_answer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "votes", ["user_id", "voteable_id", "voteable_type"], :name => "index_votes_on_user_id_and_voteable_id_and_voteable_type", :unique => true

end
