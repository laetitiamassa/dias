class AddContributionFrequencyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contribution_frequency, :string
  end
end
