class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :red
      t.integer :orange
      t.integer :blue
      t.integer :green
      t.integer :yellow
      t.integer :black
      t.integer :brown
      t.integer :white

      t.timestamps
    end
  end
end
