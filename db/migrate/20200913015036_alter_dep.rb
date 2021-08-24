class AlterDep < ActiveRecord::Migration[6.0]
  def change
  	add_column("departamentos", "proyecto_id", :integer)
  end
end
