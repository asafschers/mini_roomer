class AddFieldsToReservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :ResCost, 		 :integer
  	add_column :reservations, :ResOTA,  		 :string
  	add_column :reservations, :ResOriginalPrice, :integer
  	add_column :reservations, :ResReservedPrice, :integer
  	add_column :reservations, :ResPayment, 		 :string

  	remove_column :reservations, :UserId
  	remove_column :reservations, :HotelId
  end
end
