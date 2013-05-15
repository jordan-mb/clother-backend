class CreatePhotosPreferences < ActiveRecord::Migration
  def change
    create_table :photo_preferences do |t|
      t.integer :photo_id
      t.integer :preferences_id
    end
  end
end
