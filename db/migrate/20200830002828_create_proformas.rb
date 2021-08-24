class CreateProformas < ActiveRecord::Migration[6.0]
  def change
    create_table :proformas do |t|
      t.string :no_cliente
      t.string :nu_dni
      t.string :nu_celular
      t.string :email_cliente
      t.string :no_proyecto
      t.integer :numero_piso
      t.float :costo_m2
      t.float :area_total

      t.timestamps
    end
  end
end
