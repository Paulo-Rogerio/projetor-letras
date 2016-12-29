class RecadosController < ApplicationController
  before_action :set_recado, only: [:show, :edit, :update, :destroy]

  # GET /recados
  # GET /recados.json
  def index
    @recados = Recado.all.paginate(:page => params[:page], :per_page => 7).order(created_at: :desc)
  end

  # GET /recados/1
  # GET /recados/1.json
  def show
  end

  # GET /recados/new
  def new
    @recado = Recado.new
  end

  # GET /recados/1/edit
  def edit
  end


  def imprimir
      consulta = "SELECT * FROM recados WHERE id = #{params[:id]} ORDER BY created_at"
      @projetar_recado = Recado.find_by_sql(consulta)

      # Opções:
      # 110 => Margem Superior
      # 275 => Margem Direita
      # 10  => Margem Inferior
      # 250 => Margem Esquerda

      pdf = Prawn::Document::new :margin => [110, 275, 10, 260],:page_layout => :landscape
      # pdf.image "public/images/logo_impressao_recado.png", :width => 90, :heigth => 90, :at => [-90, 520]
      # pdf.image "public/images/logo_impressao_recado.png", :width => 90, :heigth => 90, :at => [250, 520]
      pdf.image "public/images/logo_impressao_recado.png", :width => 90, :heigth => 90, :at => [-90, 520]
      pdf.image "public/images/logo_impressao_recado.png", :width => 90, :heigth => 90, :at => [250, 520]
      pdf.move_down(12)
      pdf.font 'Helvetica', :size => 20
      pdf.text "Informativo Videira", :style => :bold, :align => :center
      pdf.move_down(40)


      pdf.text "#{params[:interessado]}", :style => :bold, :align => :center, :size => 20
      pdf.move_down(15)

      # Variavel que será alimentada
      data = []

      @projetar_recado.each do |imp|
        cont = []
        cont << {:content => imp.recado, :align => :center }
        data << cont
      end

    pdf.table (data)
    send_data pdf.render, :filename => "relatorio.pdf", :type => "application/pdf", disposition: "inline"
  end


  # POST /recados
  # POST /recados.json
  def create
    @recado = Recado.new(recado_params)

    respond_to do |format|
      if @recado.save
        format.html { redirect_to @recado, notice: 'Recado was successfully created.' }
        format.json { render :show, status: :created, location: @recado }
      else
        format.html { render :new }
        format.json { render json: @recado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recados/1
  # PATCH/PUT /recados/1.json
  def update
    respond_to do |format|
      if @recado.update(recado_params)
        format.html { redirect_to @recado, notice: 'Recado was successfully updated.' }
        format.json { render :show, status: :ok, location: @recado }
      else
        format.html { render :edit }
        format.json { render json: @recado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recados/1
  # DELETE /recados/1.json
  def destroy
    @recado.destroy
    respond_to do |format|
      format.html { redirect_to recados_url, notice: 'Recado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recado
      @recado = Recado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recado_params
      params.require(:recado).permit(:interessado, :recado)
    end
end
