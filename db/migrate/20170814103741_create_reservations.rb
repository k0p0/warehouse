class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :status
      t.date :starts_on
      t.date :ends_on
      t.references :user, foreign_key: true
      t.references :storehouse, foreign_key: true

      t.timestamps
    end
  end
end
