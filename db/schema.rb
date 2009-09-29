# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090924162938) do

  create_table "games", :force => true do |t|
    t.integer  "team_a_score"
    t.integer  "team_b_score"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.integer  "rating",     :default => 5000
    t.integer  "w",          :default => 0
    t.integer  "l",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players_games", :force => true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.string   "team",       :limit => 1
    t.integer  "rating_in"
    t.integer  "rating_out"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
