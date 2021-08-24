class CreateProyectos < ActiveRecord::Migration[6.0]
  def change
    create_table :proyectos do |t|
      t.string :nombre_proy
      t.text :ubicacion_proy
      t.text :precio_base
      t.text :foto_proy

      t.timestamps
    end
  end
end
