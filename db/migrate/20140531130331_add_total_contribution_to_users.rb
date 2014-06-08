class AddTotalContributionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_contribution, :integer
  end
end
