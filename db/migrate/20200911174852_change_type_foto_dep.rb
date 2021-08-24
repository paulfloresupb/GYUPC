class ChangeTypeFotoDep < ActiveRecord::Migration[6.0]
  def up
    change_table :departamentos do |t|
      t.change :foto_dep, :string
    end
  end

  def down
    change_table :departamentos do |t|
      t.change :foto_dep, :text
    end
  end
end
