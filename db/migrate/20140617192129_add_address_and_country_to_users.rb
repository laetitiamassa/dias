class AddAddressAndCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :country, :string
  end
end
