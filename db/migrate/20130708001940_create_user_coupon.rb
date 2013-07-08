class CreateUserCoupon < ActiveRecord::Migration
  def change
    create_table :user_coupons do |t|
      t.integer :user_id
      t.integer :coupon_id
      t.integer :expiration_date
      t.string :code

      t.timestamps
    end
  end
end
