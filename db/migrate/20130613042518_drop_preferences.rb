class DropPreferences < ActiveRecord::Migration
  def change
    drop_table :preferences 
    drop_table :photo_preferences
  end  
end
