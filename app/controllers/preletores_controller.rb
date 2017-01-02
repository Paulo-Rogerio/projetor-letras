class PreletoresController < ApplicationController
  # before_action :set_preletor, only: [:show, :edit, :update, :destroy]

  # # GET /preletores
  # # GET /preletores.json
  # def index
  #   @preletores = Preletor.all
  # end

  # # GET /preletores/1
  # # GET /preletores/1.json
  # def show
  # end

  # GET /preletores/new
  # def new
  #   @preletor = Preletor.new
  #   @predio = Predio.all
  # end

  # # GET /preletores/1/edit
  # def edit
  # end

  # # POST /preletores
  # # POST /preletores.json
  # def create
  #   @preletor = Preletor.new(preletor_params)

  #   respond_to do |format|
  #     if @preletor.save
  #       format.html { redirect_to @preletor, notice: 'Preletor was successfully created.' }
  #       format.json { render :show, status: :created, location: @preletor }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @preletor.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /preletores/1
  # # PATCH/PUT /preletores/1.json
  # def update
  #   respond_to do |format|
  #     if @preletor.update(preletor_params)
  #       format.html { redirect_to @preletor, notice: 'Preletor was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @preletor }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @preletor.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /preletores/1
  # # DELETE /preletores/1.json
  # def destroy
  #   @preletor.destroy
  #   respond_to do |format|
  #     format.html { redirect_to preletores_url, notice: 'Preletor was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_preletor
  #     @preletor = Preletor.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def preletor_params
  #     params.require(:preletor).permit(:nome, :funcao, :predio_id)
    # end
end
