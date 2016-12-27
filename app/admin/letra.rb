ActiveAdmin.register Letra do
  permit_params :nome, :cantor, :letra, :arquivo

    index do
      selectable_column
      column :nome
      column :cantor
      column :arquivo
      column "Criado em", :created_at
      actions
    end

    show do |t|
      attributes_table do
        row :nome
        row :cantor
        row :letra
        row :arquivo
      end
    end

    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        f.input :nome
        f.input :cantor
        f.input :letra
        f.input :arquivo
      end
      f.actions
   end

  # Personalização controller
  controller do
    def create
      super do |format|
          redirect_to(
            admin_letras_path,
            notice: 'Letra criada com sucesso.'
          ) and return
      end
    end


    def update
      super do |format|
          redirect_to(
            admin_letras_path,
            notice: 'Letra atualizada com sucesso.'
          ) and return
      end
    end


    def destroy
      super do |format|
        redirect_to(
            admin_letras_path,
            notice: 'Letra removida com sucesso.'
          ) and return
      end
    end
  end
end
