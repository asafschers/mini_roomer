class AddMapToReservation < ActiveRecord::Migration
  def change


	add_column :reservations, :latitude,  :float #you can change the name, see wiki
	add_column :reservations, :longitude, :float #you can change the name, see wiki
	add_column :reservations, :gmaps, :boolean #not mandatory, see wiki

  end
end
