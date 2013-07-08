class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :user_tags
  has_many :tags, :through => :user_tags

  has_many :user_coupons
  has_many :coupons, :through => :user_coupons
end
