class AlterProyectos < ActiveRecord::Migration[6.0]
  def change
  	add_column("proyectos", "descrip_proy", :text)
  end
end
