ActiveAdmin.register Funcao do

menu parent: "Palavras"

  permit_params :funcao

    index do
      selectable_column
      column :funcao
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
        f.input :funcao
      end
      f.actions
   end

  # Personalização controller
  controller do
    def create
      super do |format|
          redirect_to(
            admin_funcoes_path,
            notice: 'Função criada com sucesso.'
          ) and return
      end
    end


    def update
      super do |format|
          redirect_to(
            admin_funcoes_path,
            notice: 'Função atualizada com sucesso.'
          ) and return
      end
    end


    def destroy
      super do |format|
        redirect_to(
            admin_funcoes_path,
            notice: 'Função removida com sucesso.'
          ) and return
      end
    end
  end
end
