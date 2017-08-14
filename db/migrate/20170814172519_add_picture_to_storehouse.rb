class AddPictureToStorehouse < ActiveRecord::Migration[5.1]
  def change
    add_column :storehouses, :picture, :string
  end
end
