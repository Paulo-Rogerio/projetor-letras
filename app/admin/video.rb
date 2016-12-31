ActiveAdmin.register Video do
  permit_params :nome, :publico, :arquivo

  menu label: "Videira-News"
  index :title => "Videira-News"


  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs 'Videos' do
       f.input :nome 
       f.input :publico, :publico => 'Publico', :as => :select, :collection => options_for_select([['Adulto','Adulto'],['Kids','Kids']], params[:publico]), include_blank:'selecione'
       f.input :arquivo
    end
     f.actions
   end


  index do
	  selectable_column
	  column :nome
	  column :publico
	  column :arquivo
	  column "Criado em", :created_at
	  actions
   end

   show do |t|
	  attributes_table do
	    row :nome
	    row :publico
	    row :arquivo
	  end
   end

  # Personalização controller
  controller do
    def create
      super do |format|
          redirect_to(
            admin_videos_path,
            notice: 'Video criado com sucesso.'
          ) and return
      end
    end


    def update
      super do |format|
          redirect_to(
            admin_videos_path,
            notice: 'Video atualizado com sucesso.'
          ) and return
      end
    end


    def destroy
      super do |format|
        redirect_to(
            admin_videos_path,
            notice: 'Video deletado com sucesso.'
          ) and return
      end
    end
  end

end
