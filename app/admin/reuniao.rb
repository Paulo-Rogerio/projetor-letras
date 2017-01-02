ActiveAdmin.register Reuniao do

menu parent: "Palavras"

  permit_params :palavra, :preletor_id, :resumo, :dia_reuniao, :predio_id, :arquivo, :publico, :tema_id

	form :html => { :enctype => "multipart/form-data" } do |f|
	     f.inputs 'Reunião' do
	       f.input :palavra
	       f.input :resumo
	       f.input :publico, :publico => 'Publico', :as => :select, :collection => options_for_select([['Adulto','Adulto'],['Kids','Kids']], params[:publico]), include_blank:'selecione' 
         f.input :tema_id, :label => 'Tema', :as => :select, :collection => Tema.all.map{|t| ["#{t.tema}", t.id]}, include_blank: 'selecione'
	       f.input :preletor_id, :label => 'Preletor', :as => :select, :collection => Preletor.all.map{|n| ["#{n.nome}", n.id]}, include_blank: 'selecione'
	       f.input :predio_id, :label => 'Predio', :as => :select, :collection => Predio.all.map{|p| ["#{p.predio}", p.id]}, include_blank: 'selecione'
         f.input :dia_reuniao, as: :datepicker, datepicker_options: {dateFormat: 'yy/mm/dd'}
         f.input :arquivo
	    end
	     f.actions
	end


    index do
      selectable_column
      column :palavra
      column :publico    
      column "Tema" do |t|
         t.tema.tema
      end
      column "Preletor" do |n|
         n.preletor.nome
      end
      column "Prédio" do |p|
         p.predio.predio
      end
      column :arquivo
      column "Dia da Reunião", :dia_reuniao
      actions
    end

    show do |t|
      attributes_table do
        row :palavra
        row :publico
        row :resumo
        row "Tema" do |t|
           t.tema.tema
        end
        row "Preletor" do |n|
           n.preletor.nome
        end
        row "Prédio" do |p|
           p.predio.predio
        end
        row :arquivo
      end
    end

  # Personalização controller
  controller do
    def create
      super do |format|
          redirect_to(
            admin_reunioes_path,
            notice: 'Reunião criada com sucesso.'
          ) and return
      end
    end


    def update
      super do |format|
          redirect_to(
            admin_reunioes_path,
            notice: 'Reunião atualizada com sucesso.'
          ) and return
      end
    end


    def destroy
      super do |format|
        redirect_to(
            admin_reunioes_path,
            notice: 'Reunião removida com sucesso.'
          ) and return
      end
    end
  end

end
