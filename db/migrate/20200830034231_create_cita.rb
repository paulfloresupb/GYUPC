class CreateCita < ActiveRecord::Migration[6.0]
  def change
    create_table :cita do |t|
      t.string :dni
      t.string :nombre
      t.string :apellido
      t.string :correo
      t.integer :telefono
      t.date :fechaCita
      t.time :horaCita
      t.references :estado, null: false, foreign_key: true
      t.references :asesor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
