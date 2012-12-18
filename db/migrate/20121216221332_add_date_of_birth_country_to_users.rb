class AddDateOfBirthCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :date_of_birth, :date
  end
end
