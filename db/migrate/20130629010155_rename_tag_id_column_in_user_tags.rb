class RenameTagIdColumnInUserTags < ActiveRecord::Migration
  def change
    rename_column :user_tags, :photo_id, :tag_id
  end
end
