class Photo < ActiveRecord::Base
  attr_accessible :file

  has_many :tags, :through => :photo_tag
end
