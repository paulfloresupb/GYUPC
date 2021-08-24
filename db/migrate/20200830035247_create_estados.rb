class CreateEstados < ActiveRecord::Migration[6.0]
  def change
    create_table :estados do |t|
      t.string :icodigo
      t.string :descripcion

      t.timestamps
    end
  end
end
