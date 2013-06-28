class AddPhotoFile < ActiveRecord::Migration
  def change
    remove_column :photos, :image_path
    add_column :photos, :file, :binary
  end
end
