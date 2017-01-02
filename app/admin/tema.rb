ActiveAdmin.register Tema do

menu parent: "Palavras"
  permit_params :tema

    index do
      selectable_column
      column :tema
      column "Criado em", :created_at
      actions
    end

    show do |t|
      attributes_table do
        row :tema
      end
    end

    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        f.input :tema
      end
      f.actions
   end

  # Personalização controller
  controller do
    def create
      super do |format|
          redirect_to(
            admin_temas_path,
            notice: 'Tema criada com sucesso.'
          ) and return
      end
    end


    def update
      super do |format|
          redirect_to(
            admin_temas_path,
            notice: 'Tema atualizado com sucesso.'
          ) and return
      end
    end


    def destroy
      super do |format|
        redirect_to(
            admin_temas_path,
            notice: 'Tema removido com sucesso.'
          ) and return
      end
    end
  end
end
