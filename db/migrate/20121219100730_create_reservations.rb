class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :ResConfirmationNum
      t.datetime :ResCheckIn
      t.datetime :ResCheckOut
      t.integer :ResNumAdults
      t.integer :ResNumChildren
      t.string :ResCancelationCause
      t.string :ResSource
      t.integer :HotelId
      t.integer :UserId

      t.timestamps
    end

  end
end
