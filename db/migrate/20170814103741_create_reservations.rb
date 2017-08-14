class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :status
      t.date :start_on
      t.date :end_on
      t.references :user, foreign_key: true
      t.references :storehouse, foreign_key: true

      t.timestamps
    end
  end
end
