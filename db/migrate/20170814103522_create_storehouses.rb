class CreateStorehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :storehouses do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
