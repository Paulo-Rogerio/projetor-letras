class ReunioesletrasController < ApplicationController
  before_action :set_reuniaoletra, only: [:show, :edit, :update, :destroy]

  # GET /reunioesletras
  # GET /reunioesletras.json
  def index
    @reunioesletras = Reuniaoletra.all.paginate(:page => params[:page], :per_page => 7).order(created_at: :desc)
  end

  # GET /reunioesletras/1
  # GET /reunioesletras/1.json
  def show
    @letras = Letra.joins(:letras_reunioesletras).where("reuniaoletra_id = #{params[:id]}").order("letras_reunioesletras.created_at")
  end

  # GET /reunioesletras/new
  def new
    @reuniaoletra = Reuniaoletra.new
  end

  # GET /reunioesletras/1/edit
  def edit
  end

  # POST /reunioesletras
  # POST /reunioesletras.json
  def create
    @reuniaoletra = Reuniaoletra.new(reuniaoletra_params)

    respond_to do |format|
      if @reuniaoletra.save
        format.html { redirect_to @reuniaoletra, notice: 'Reuniaoletra was successfully created.' }
        format.json { render :show, status: :created, location: @reuniaoletra }
      else
        format.html { render :new }
        format.json { render json: @reuniaoletra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reunioesletras/1
  # PATCH/PUT /reunioesletras/1.json
  def update
    respond_to do |format|
      if @reuniaoletra.update(reuniaoletra_params)
        format.html { redirect_to @reuniaoletra, notice: 'Reuniaoletra was successfully updated.' }
        format.json { render :show, status: :ok, location: @reuniaoletra }
      else
        format.html { render :edit }
        format.json { render json: @reuniaoletra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reunioesletras/1
  # DELETE /reunioesletras/1.json
  def destroy
    @reuniaoletra.destroy
    respond_to do |format|
      format.html { redirect_to reunioesletras_url, notice: 'Reuniaoletra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reuniaoletra
      @reuniaoletra = Reuniaoletra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reuniaoletra_params
        params.require(:reuniaoletra).permit(:nome, :data,
                                             :letras_reunioesletras_attributes => [:id, :letra_id, :_destroy,
                                             :letra_attibutes => [:id, :nome, :cantor]])

    end
end
