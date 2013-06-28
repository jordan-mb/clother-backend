class Tag < ActiveRecord::Base
  attr_accessible :title, :body

  has_many :photo_tags
  has_many :photos, :through => :photo_tags
end
