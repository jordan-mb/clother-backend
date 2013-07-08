class Tag < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name
  validates_length_of :name, :within => 2..50

  has_many :photo_tags
  has_many :photos, :through => :photo_tags

  has_many :user_tags
  has_many :users, :through => :user_tags

  has_many :coupon_tags
  has_many :coupons, :through => :coupon_tags
end
