class AddBirthplaceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birth_place, :string
  end
end
