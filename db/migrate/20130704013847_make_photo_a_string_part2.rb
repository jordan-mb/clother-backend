class MakePhotoAStringPart2 < ActiveRecord::Migration
  def change
    add_column :photos, :file, :string
  end
end
