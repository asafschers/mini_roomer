class AddHotelIdIndexToReservations < ActiveRecord::Migration
  def change
  	add_index :reservations, [:HotelId]
  	add_index :reservations, [:UserId]
  end
end
