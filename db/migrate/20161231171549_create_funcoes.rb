class CreateFuncoes < ActiveRecord::Migration
  def change
    create_table :funcoes do |t|
      t.string :funcao

      t.timestamps null: false
    end
  end
end
