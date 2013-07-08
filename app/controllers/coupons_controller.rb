class CouponsController < ApplicationController
  before_filter :authenticate_user!

  def new
    admin
    @tags = Tag.all
  end

  def create
    admin

    coupon = Coupon.new
    coupon.percent_off = params[:percent_off]
    coupon.store = params[:store]
    coupon.clothing_name = params[:clothing_name]
    coupon.days_valid_for = params[:days_valid_for]
    coupon.full_price = params[:full_price]

    if coupon.save
      Tag.all.each do |tag|
        if params["tag#{tag.id}"]
          if tag
            CouponTag.create(
              :coupon_id => coupon.id,
              :tag_id => tag.id,
            )
          end
        end
      end
    end

    redirect_to root_path
  end

  def index
    admin
    @coupons = Coupon.all
  end

  def show
    admin
    @coupon = Coupon.find(params[:id])
  end

  def destroy
    admin

    coupon = Coupon.find(params[:id])
    if coupon
      coupon.delete

      CouponTag.all.each do |ct|
        if ct.coupon_id = coupon.id
          ct.delete
        end
      end

      UserCoupon.all.each do |uc|
        if uc.coupon_id = coupon.id
          uc.delete
        end
      end
    end

    redirect_to coupons_path
  end

  #def match_coupon
    #make sure they haven't had a coupon for this piece of clothing before
  #end
end
