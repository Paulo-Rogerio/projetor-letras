class RemoveDataRecados < ActiveRecord::Migration
  def change
  	remove_column :recados, :data
  end
end
