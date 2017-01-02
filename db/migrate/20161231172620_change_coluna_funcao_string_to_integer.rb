class ChangeColunaFuncaoStringToInteger < ActiveRecord::Migration
  def change
     remove_column :preletores, :funcao
     add_column    :preletores, :funcao_id, :integer
  end
end
