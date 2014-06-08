class AddFundingToProject < ActiveRecord::Migration
  def change
    add_column :projects, :funding, :integer
  end
end
