class AddMorePreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :dress, :integer
    add_column :preferences, :short_dress, :integer
    add_column :preferences, :long_dress, :integer
    add_column :preferences, :strapless_dress, :integer
    add_column :preferences, :tshirt, :integer
    add_column :preferences, :pink, :integer
  end
end
