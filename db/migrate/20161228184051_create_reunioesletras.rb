class CreateReunioesletras < ActiveRecord::Migration
  def change
    create_table :reunioesletras do |t|
      t.text :nome
      t.date :data

      t.timestamps null: false
    end
  end
end
