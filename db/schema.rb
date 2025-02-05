# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_17_234650) do

  create_table "ciudads", force: :cascade do |t|
    t.string "nombre"
    t.string "provincia"
    t.text "descrip"
    t.string "url_img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ciudads_viajes", id: false, force: :cascade do |t|
    t.integer "ciudad_id"
    t.integer "viaje_id"
    t.index ["ciudad_id"], name: "index_ciudads_viajes_on_ciudad_id"
    t.index ["viaje_id"], name: "index_ciudads_viajes_on_viaje_id"
  end

  create_table "combis", force: :cascade do |t|
    t.string "patente"
    t.string "tipo"
    t.integer "cant_asientos"
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comprars", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_comprars_on_user_id"
  end

  create_table "insumos", force: :cascade do |t|
    t.string "nombre"
    t.float "precio"
    t.string "url_img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stock"
    t.integer "cantidad"
  end

  create_table "join_insumos_pasajes", force: :cascade do |t|
    t.integer "insumo_id"
    t.integer "pasaje_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["insumo_id"], name: "index_join_insumos_pasajes_on_insumo_id"
    t.index ["pasaje_id"], name: "index_join_insumos_pasajes_on_pasaje_id"
  end

  create_table "pasajes", force: :cascade do |t|
    t.string "titular"
    t.string "dni_t"
    t.integer "precio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "comprar_id"
    t.integer "viaje_id"
    t.integer "nro_t"
    t.integer "v_m_tarjeta"
    t.integer "v_a_tarjeta"
    t.integer "cod_t"
    t.float "total"
    t.string "nombre_tarjeta"
    t.integer "dni_tarjeta"
    t.string "estado"
    t.integer "viaj_aux"
    t.index ["comprar_id"], name: "index_pasajes_on_comprar_id"
    t.index ["user_id"], name: "index_pasajes_on_user_id"
    t.index ["viaje_id"], name: "index_pasajes_on_viaje_id"
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "dni"
    t.integer "celular"
    t.string "nombre"
    t.datetime "fecha_de_nacimiento"
    t.integer "role", default: 1
    t.integer "card"
    t.integer "cods"
    t.integer "vencimientoMes"
    t.integer "vencimientoAño"
    t.boolean "libre", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venta", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "viajes", force: :cascade do |t|
    t.integer "origen"
    t.integer "destino"
    t.time "hor_salida"
    t.time "hor_llegada"
    t.integer "precio"
    t.integer "cant_pasajes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "combi_id"
    t.integer "user_id"
    t.date "fecha_salida"
    t.date "fecha_llegada"
    t.string "estado"
    t.index ["combi_id"], name: "index_viajes_on_combi_id"
    t.index ["user_id"], name: "index_viajes_on_user_id"
  end

  add_foreign_key "comprars", "users"
  add_foreign_key "join_insumos_pasajes", "insumos"
  add_foreign_key "join_insumos_pasajes", "pasajes"
  add_foreign_key "pasajes", "comprars"
  add_foreign_key "pasajes", "users"
  add_foreign_key "pasajes", "viajes"
  add_foreign_key "viajes", "combis"
  add_foreign_key "viajes", "users"
end
