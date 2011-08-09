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

ActiveRecord::Schema.define(:version => 20110712134013) do

  create_table "analistas", :force => true do |t|
    t.string  "nome"
    t.string  "especialidade"
    t.integer "cargo_id"
  end

  add_index "analistas", ["cargo_id"], :name => "fk_analistas_cargo"

  create_table "analistas_projetos", :id => false, :force => true do |t|
    t.integer "analista_id"
    t.integer "projeto_id"
  end

  add_index "analistas_projetos", ["analista_id"], :name => "fk_analistasprojetos_analista"
  add_index "analistas_projetos", ["projeto_id"], :name => "fk_analistasprojetos_projeto"

  create_table "cargos", :force => true do |t|
    t.string "nome"
  end

  create_table "projetos", :force => true do |t|
    t.string "nome"
    t.text   "descricao"
    t.date   "data_inicio"
    t.date   "data_fim"
  end

end
