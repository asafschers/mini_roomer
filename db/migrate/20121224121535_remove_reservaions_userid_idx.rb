class RemoveReservaionsUseridIdx < ActiveRecord::Migration
  def change
  	remove_index :reservations, :UserId
  end


end
