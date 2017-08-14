class AddDescriptionToStorehouse < ActiveRecord::Migration[5.1]
  def change
    add_column :storehouses, :description, :string
  end
end
