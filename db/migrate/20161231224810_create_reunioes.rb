class CreateReunioes < ActiveRecord::Migration
  def change
    create_table :reunioes do |t|
      t.string :palavra
      t.integer :preletor_id
      t.text :resumo
      t.date :dia_reuniao
      t.integer :predio_id
      t.string :arquivo
      t.string :publico
      t.integer :tema_id

      t.timestamps null: false
    end
  end
end
