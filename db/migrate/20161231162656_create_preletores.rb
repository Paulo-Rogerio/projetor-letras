class CreatePreletores < ActiveRecord::Migration
  def change
    create_table :preletores do |t|
      t.string :nome
      t.string :funcao
      t.integer :predio_id

      t.timestamps null: false
    end
  end
end
