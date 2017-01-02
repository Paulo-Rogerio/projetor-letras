ActiveAdmin.register Preletor do

menu parent: "Palavras"
  permit_params :nome, :funcao_id, :predio_id

	form :html => { :enctype => "multipart/form-data" } do |f|
	     f.inputs 'Preletor' do
	       f.input :nome 
         f.input :funcao_id, :label => 'Função', :as => :select, :collection => Funcao.all.map{|f| ["#{f.funcao}", f.id]}, include_blank: 'selecione'
	       f.input :predio_id, :label => 'Predio', :as => :select, :collection => Predio.all.map{|p| ["#{p.predio}", p.id]}, include_blank: 'selecione'
	    end
	     f.actions
	end


    index do
      selectable_column
      column :nome    
      column "Função" do |f|
         f.funcao.funcao
      end
      column "Prédio" do |p|
         p.predio.predio
      end
      column "Criado em", :created_at
      actions
    end

    show do |t|
      attributes_table do
        row :nome
        row "Função" do |f|
           f.funcao.funcao
        end
        row "Prédio" do |p|
         p.predio.predio
        end
      end
    end

  # Personalização controller
  controller do
    def create
      super do |format|
          redirect_to(
            admin_preletores_path,
            notice: 'Preletor criado com sucesso.'
          ) and return
      end
    end


    def update
      super do |format|
          redirect_to(
            admin_preletores_path,
            notice: 'Preletor atualizado com sucesso.'
          ) and return
      end
    end


    def destroy
      super do |format|
        redirect_to(
            admin_preletores_path,
            notice: 'Preletor removido com sucesso.'
          ) and return
      end
    end
  end
end
