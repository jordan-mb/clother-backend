class Coupon < ActiveRecord::Base
  attr_accessible :percent_off, :store, :clothing_name, :days_valid_for, :full_price

  validates_presence_of :percent_off, :store, :clothing_name, :days_valid_for, :full_price

  validates :percent_off, :inclusion => 1..99
  validates :full_price, :numericality => { :greater_than => 0 }
  validates :days_valid_for, :numericality => { :greater_than => 0 }

  has_many :user_coupons
  has_many :users, :through => :user_coupons

  has_many :coupon_tags
  has_many :tags, :through => :coupon_tags
end
