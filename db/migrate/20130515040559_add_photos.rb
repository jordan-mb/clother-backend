class AddPhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image_path
    end
  end
end
