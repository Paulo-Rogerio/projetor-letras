class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :nome
      t.string :publico
      t.string :arquivo

      t.timestamps null: false
    end
  end
end
