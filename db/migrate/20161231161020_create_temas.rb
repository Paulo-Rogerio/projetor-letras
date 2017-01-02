class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.string :tema

      t.timestamps null: false
    end
  end
end
