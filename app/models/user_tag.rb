class UserTag < ActiveRecord::Base
  attr_accessible :user_id, :tag_id, :value

  validates_presence_of :user_id, :tag_id, :value
end
