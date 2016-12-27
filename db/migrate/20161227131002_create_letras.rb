class CreateLetras < ActiveRecord::Migration
  def change
    create_table :letras do |t|
      t.string :nome
      t.string :cantor
      t.text :letra
      t.string :arquivo

      t.timestamps null: false
    end
  end
end
