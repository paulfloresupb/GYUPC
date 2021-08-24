class DepartamentosController < ApplicationController
  before_action :set_departamento, only: [:show, :edit, :update, :destroy]

  # GET /departamentos
  # GET /departamentos.json
  def index
       @proyecto = Proyecto.find(params[:proyecto_id])
       @departamentos = @proyecto.departamentos
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
    @proyecto = Proyecto.find(params[:proyecto_id])
    @departamento = Departamento.find(params[:id])
  end

  # GET /departamentos/new
  def new
    @proyecto = Proyecto.find(params[:proyecto_id])
    @departamento = Departamento.new(:proyecto_id => @proyecto.id )
  end

  # GET /departamentos/1/edit
  def edit
      @proyecto = Proyecto.find(params[:proyecto_id])
      @departamento = Departamento.find(params[:id])
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @proyecto = Proyecto.find(params[:proyecto_id])
    @departamento = Departamento.new(departamento_params)
    @departamento.proyecto = @proyecto
    respond_to do |format|
      if @departamento.save
        format.html { redirect_to departamentos_path(:proyecto_id => @proyecto.id), notice: 'Departamento was successfully created.' }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1
  # PATCH/PUT /departamentos/1.json
  def update
     @proyecto = Proyecto.find(params[:proyecto_id])
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to departamento_path(@departamento, :proyecto_id => @proyecto.id), notice: 'Departamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento.destroy
    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: 'Departamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def departamento_params
      params.require(:departamento).permit(:nombre_dep, :piso_dep, :area, :nro_habitacion, {foto_dep: []}, :proyecto_id)
    end
end
