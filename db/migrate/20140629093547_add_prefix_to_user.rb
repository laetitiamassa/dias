class AddPrefixToUser < ActiveRecord::Migration
  def change
    add_column :users, :prefix, :integer
  end
end
