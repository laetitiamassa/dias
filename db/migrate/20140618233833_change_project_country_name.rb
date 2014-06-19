class ChangeProjectCountryName < ActiveRecord::Migration
  def self.up
    rename_column :projects, :country, :pays
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
