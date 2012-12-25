class AddToHotelsHotelIdIdx < ActiveRecord::Migration
  def change
  	add_column :reservations, :hotel_id, :integer

  	add_index :reservations, [:hotel_id]

  end
end
