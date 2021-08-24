class CreateDepartamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :departamentos do |t|
      t.string :nombre_dep
      t.integer :piso_dep
      t.text :area
      t.integer :nro_habitacion
      t.text :foto_dep

      t.timestamps
    end
  end
end
