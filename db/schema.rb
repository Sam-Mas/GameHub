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

ActiveRecord::Schema.define(version: 20150325070442) do

  create_table "challengers", force: :cascade do |t|
    t.string   "name"
    t.float    "balance",      default: 500.0
    t.boolean  "turn_taken",   default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "opponent"
    t.string   "token"
    t.integer  "coin_game_id"
  end

  create_table "game_coin_games", force: :cascade do |t|
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "challenger_id"
    t.integer  "score1",           default: 0
    t.integer  "score2",           default: 0
    t.integer  "num_turns",        default: 10
    t.integer  "winner",           default: 0
    t.boolean  "player_1_turn",    default: true
    t.string   "last_guess",       default: "No guess's yet"
    t.string   "last_flip_result", default: "No flips yet"
    t.boolean  "game_full",        default: false
  end

  add_index "game_coin_games", ["challenger_id"], name: "index_game_coin_games_on_challenger_id"

end
