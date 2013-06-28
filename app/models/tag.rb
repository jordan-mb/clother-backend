class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :photo_tags
  has_many :photos, :through => :photo_tags

  validates_presence_of :name
  validates_length_of :name, :within => 2..50
end
