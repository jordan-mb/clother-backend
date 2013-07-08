class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :photos
  has_many :tags, :through => :photos

  has_many :user_coupons
  has_many :coupons, :through => :user_coupons
end
