class ReunioesController < ApplicationController
  before_action :set_reuniao, only: [:show, :edit, :update, :destroy]

  # GET /reunioes
  # GET /reunioes.json
  def index
 
    # Cria uma condicao (Clausula Where) para a aplicacar os valores inserido pelo usuario.
    conditions = []
    # Checa se o params[:localizar] é diferente de nulo e diferente de vazio
    
    if params[:localizar] != nil && params[:localizar] != ''
      conditions << "reunioes.palavra ILIKE '%#{params[:localizar]}%'"
      conditions << "preletores.nome ILIKE '%#{params[:localizar]}%'"
      conditions << "reunioes.publico ILIKE '%#{params[:localizar]}%'"
      conditions << "temas.tema ILIKE '%#{params[:localizar]}%'"
      conditions << "reunioes.resumo ILIKE '%#{params[:localizar]}%'"
    end

    @preletor = Preletor.all
    @tema = Tema.all
    @predio = Predio.all
    @reunioes =  Reuniao.joins(:predio, :tema, :preletor).where("#{conditions.any? ? "#{conditions.join(' OR ')}" : ''}").paginate(:page => params[:page], :per_page => 7).order(created_at: :desc)

  end

  # # GET /reunioes/1
  # # GET /reunioes/1.json
  # def show
  # end

  # # GET /reunioes/new
  # def new
  #   @reuniao = Reuniao.new
  # end

  # # GET /reunioes/1/edit
  # def edit
  # end

  # # POST /reunioes
  # # POST /reunioes.json
  # def create
  #   @reuniao = Reuniao.new(reuniao_params)

  #   respond_to do |format|
  #     if @reuniao.save
  #       format.html { redirect_to @reuniao, notice: 'Reuniao was successfully created.' }
  #       format.json { render :show, status: :created, location: @reuniao }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @reuniao.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /reunioes/1
  # # PATCH/PUT /reunioes/1.json
  # def update
  #   respond_to do |format|
  #     if @reuniao.update(reuniao_params)
  #       format.html { redirect_to @reuniao, notice: 'Reuniao was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @reuniao }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @reuniao.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /reunioes/1
  # # DELETE /reunioes/1.json
  # def destroy
  #   @reuniao.destroy
  #   respond_to do |format|
  #     format.html { redirect_to reunioes_url, notice: 'Reuniao was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reuniao
      @reuniao = Reuniao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reuniao_params
      params.require(:reuniao).permit(:palavra, :preletor_id, :resumo, :dia_reuniao, :predio_id, :arquivo, :publico, :tema_id)
    end
end
