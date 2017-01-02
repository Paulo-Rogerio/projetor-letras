class CreatePredios < ActiveRecord::Migration
  def change
    create_table :predios do |t|
      t.string :predio

      t.timestamps null: false
    end
  end
end
