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

ActiveRecord::Schema.define(version: 2020_09_13_191356) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "asesors", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "user"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cita", force: :cascade do |t|
    t.string "dni"
    t.string "nombre"
    t.string "apellido"
    t.string "correo"
    t.integer "telefono"
    t.date "fechaCita"
    t.time "horaCita"
    t.integer "estado_id", null: false
    t.integer "asesor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asesor_id"], name: "index_cita_on_asesor_id"
    t.index ["estado_id"], name: "index_cita_on_estado_id"
  end

  create_table "contactos", force: :cascade do |t|
    t.string "nombre_contact"
    t.string "apellido_contact"
    t.string "email_contact"
    t.integer "telef_contact"
    t.text "consulta_contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.string "nombre_dep"
    t.integer "piso_dep"
    t.text "area"
    t.integer "nro_habitacion"
    t.string "foto_dep"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "proyecto_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "icodigo"
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proformas", force: :cascade do |t|
    t.string "no_cliente"
    t.string "nu_dni"
    t.string "nu_celular"
    t.string "email_cliente"
    t.string "no_proyecto"
    t.integer "numero_piso"
    t.float "costo_m2"
    t.float "area_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proyectos", force: :cascade do |t|
    t.string "nombre_proy"
    t.text "ubicacion_proy"
    t.text "precio_base"
    t.string "foto_proy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "descrip_proy"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cita", "asesors"
  add_foreign_key "cita", "estados"
end
