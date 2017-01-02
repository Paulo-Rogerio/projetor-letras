ActiveAdmin.register Predio do

menu parent: "Palavras"
  permit_params :predio

    index do
      selectable_column
      column :predio
      column "Criado em", :created_at
      actions
    end

    show do |t|
      attributes_table do
        row :predio
      end
    end

    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        f.input :predio
      end
      f.actions
   end

  # Personalização controller
  controller do
    def create
      super do |format|
          redirect_to(
            admin_predios_path,
            notice: 'Predio criado com sucesso.'
          ) and return
      end
    end


    def update
      super do |format|
          redirect_to(
            admin_predios_path,
            notice: 'Predio atualizado com sucesso.'
          ) and return
      end
    end


    def destroy
      super do |format|
        redirect_to(
            admin_predio_path,
            notice: 'Predio removido com sucesso.'
          ) and return
      end
    end
  end

end
