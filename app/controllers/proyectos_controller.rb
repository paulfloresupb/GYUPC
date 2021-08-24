class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /proyectos
  # GET /proyectos.json
  def index
    if params[:nombre_proy]
      nombre_proy = params[:nombre_proy]
      @proyectos = Proyecto.where(["nombre_proy LIKE ?", "%#{nombre_proy}%" ])
    else
    @proyectos = Proyecto.all
  end
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
    @proyecto = Proyecto.find(params[:id])
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
  end

  # GET /proyectos/1/edit
  def edit
    @proyecto =Proyecto.find(params[:id])
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to @proyecto, notice: 'Proyecto creado' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to @proyecto, notice: 'El proyecto fue actualizado.' }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'El proyecto fué eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proyecto_params
      params.require(:proyecto).permit(:nombre_proy, :descrip_proy,:ubicacion_proy, :precio_base, {foto_proy: []})
    end
end
