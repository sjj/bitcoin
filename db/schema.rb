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

ActiveRecord::Schema.define(:version => 20110806152718) do

  create_table "bitcoin_indices", :force => true do |t|
    t.integer  "load_time"
    t.date     "date"
    t.decimal  "index",      :precision => 18, :scale => 9, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickers", :force => true do |t|
    t.integer  "load_time"
    t.string   "exchangetype"
    t.decimal  "high",         :precision => 18, :scale => 9, :default => 0.0
    t.decimal  "low",          :precision => 18, :scale => 9, :default => 0.0
    t.decimal  "avg",          :precision => 18, :scale => 9, :default => 0.0
    t.decimal  "vwap",         :precision => 18, :scale => 9, :default => 0.0
    t.decimal  "vol",          :precision => 18, :scale => 9, :default => 0.0
    t.decimal  "last",         :precision => 18, :scale => 9, :default => 0.0
    t.decimal  "buy",          :precision => 18, :scale => 9, :default => 0.0
    t.decimal  "sell",         :precision => 18, :scale => 9, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
