class ChangeTypeCategory < ActiveRecord::Migration[6.0]
  
   def up
    change_table :proyectos do |t|
      t.change :foto_proy, :string
    end
  end

  def down
    change_table :proyectos do |t|
      t.change :foto_proy, :text
    end
  end

end
