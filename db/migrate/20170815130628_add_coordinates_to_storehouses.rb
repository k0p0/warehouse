class AddCoordinatesToStorehouses < ActiveRecord::Migration[5.1]
  def change
    add_column :storehouses, :latitude, :float
    add_column :storehouses, :longitude, :float
  end
end
