class AddIndexToReservationsUserid < ActiveRecord::Migration
  def change
  	add_index :reservations, :UserId
  end
end
