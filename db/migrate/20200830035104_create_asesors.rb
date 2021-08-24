class CreateAsesors < ActiveRecord::Migration[6.0]
  def change
    create_table :asesors do |t|
      t.string :nombre
      t.string :apellido
      t.string :user
      t.string :password

      t.timestamps
    end
  end
end
