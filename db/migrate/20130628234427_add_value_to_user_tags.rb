class AddValueToUserTags < ActiveRecord::Migration
  def change
    add_column :user_tags, :value, :integer
  end
end
