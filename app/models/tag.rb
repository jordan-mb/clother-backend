class Tag < ActiveRecord::Base
  attr_accessible :title, :body

  has_many :photos, :through => :photo_tag
end
