class ChangeColumnToReservation < ActiveRecord::Migration[5.1]
  def change
   change_table :reservations do |t|
  t.change :status, :string
end
  end
end
