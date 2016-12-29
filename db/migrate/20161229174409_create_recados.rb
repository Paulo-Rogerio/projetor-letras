class CreateRecados < ActiveRecord::Migration
  def change
    create_table :recados do |t|
      t.string :interessado
      t.text :recado
      t.date :data

      t.timestamps null: false
    end
  end
end
