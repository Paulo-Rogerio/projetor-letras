class LetrasController < ApplicationController

  def index
      conditions = []
      if params[:localizar] != nil && params[:localizar] != ''
        conditions << "nome ILIKE '%#{params[:localizar]}%'"
        conditions << "cantor ILIKE '%#{params[:localizar]}%'"
        conditions << "letra ILIKE '%#{params[:localizar]}%'"
      end
      @letras =  Letra.where("#{conditions.any? ? "#{conditions.join(' OR ')}" : ''}").paginate(:page => params[:page], :per_page => 7).order(nome: :asc)
  end

  def show
      @letra = Letra.find(params[:id])
      @letras = Letra.order("created_at desc").limit(4).offset(1)
  end

  private
    def post_params
        params.require(:letra).permit(:nome, :cantor, :letra, :arquivo)
    end
end
