class Photo < ActiveRecord::Base
  attr_accessible :file

  has_many :photo_tags
  has_many :tags, :through => :photo_tags
end
