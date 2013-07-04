class PhotoTag < ActiveRecord::Base
  attr_accessible :photo_id, :tag_id

  belongs_to :photo
  belongs_to :tag

  validates_presence_of :photo_id
  validates_presence_of :tag_id
end
