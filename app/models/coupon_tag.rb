class CouponTag < ActiveRecord::Base
  attr_accessible :coupon_id, :tag_id

  validates_presence_of :coupon_id, :tag_id

  belongs_to :coupon
  belongs_to :tag
end
