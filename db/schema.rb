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

ActiveRecord::Schema.define(version: 20161231224810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "funcoes", force: :cascade do |t|
    t.string   "funcao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "letras", force: :cascade do |t|
    t.string   "nome"
    t.string   "cantor"
    t.text     "letra"
    t.string   "arquivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "letras_reunioesletras", force: :cascade do |t|
    t.integer  "reuniaoletra_id"
    t.integer  "letra_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "letras_reunioesletras", ["letra_id"], name: "index_letras_reunioesletras_on_letra_id", using: :btree
  add_index "letras_reunioesletras", ["reuniaoletra_id"], name: "index_letras_reunioesletras_on_reuniaoletra_id", using: :btree

  create_table "predios", force: :cascade do |t|
    t.string   "predio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preletores", force: :cascade do |t|
    t.string   "nome"
    t.integer  "predio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "funcao_id"
  end

  create_table "recados", force: :cascade do |t|
    t.string   "interessado"
    t.text     "recado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reunioes", force: :cascade do |t|
    t.string   "palavra"
    t.integer  "preletor_id"
    t.text     "resumo"
    t.date     "dia_reuniao"
    t.integer  "predio_id"
    t.string   "arquivo"
    t.string   "publico"
    t.integer  "tema_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reunioesletras", force: :cascade do |t|
    t.text     "nome"
    t.date     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temas", force: :cascade do |t|
    t.string   "tema"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "nome"
    t.string   "publico"
    t.string   "arquivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "letras_reunioesletras", "letras"
  add_foreign_key "letras_reunioesletras", "reunioesletras"
end
