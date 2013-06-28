class Photo < ActiveRecord::Base
  attr_accessible :file

  has_many :photo_tags
  has_many :tags, :through => :photo_tags

  validates_presence_of :file
  validate :file_size_validation

  def file_size_validation
    errors[:file] << "should be less than 1MB" if file.size > 1.megabytes
  end
end
