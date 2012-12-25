class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :HotName
      t.string :HotChain
      t.string :HotState
      t.string :HotCity
      t.string :HotAddress
      t.float :HotLongitude
      t.float :HotLatitude
      t.string :HotEmail
      t.integer :HotPostalCode

      t.timestamps
    end
  end
end
