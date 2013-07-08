class UserCoupon < ActiveRecord::Base
  attr_accessible :user_id, :coupon_id, :expiration_date, :code

  belongs_to :user
  belongs_to :coupon

  validates_presence_of :user_id, :coupon_id, :expiration_date, :code
  validate :expiration_date_in_future?

  private
  def expiration_date_in_future?
    unless Date.today < expiration_date
      errors.add(:expiration_date, "must expire in the future")
    end
  end
end
