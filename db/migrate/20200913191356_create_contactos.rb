class CreateContactos < ActiveRecord::Migration[6.0]
  def change
    create_table :contactos do |t|
      t.string :nombre_contact
      t.string :apellido_contact
      t.string :email_contact
      t.integer :telef_contact
      t.text :consulta_contact

      t.timestamps
    end
  end
end
