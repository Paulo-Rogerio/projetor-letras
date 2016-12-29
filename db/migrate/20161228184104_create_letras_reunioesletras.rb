class CreateLetrasReunioesletras < ActiveRecord::Migration
  def change
    create_table :letras_reunioesletras do |t|
      t.references :reuniaoletra, index: true, foreign_key: true
      t.references :letra, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
