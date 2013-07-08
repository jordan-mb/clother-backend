class CreateCouponTags < ActiveRecord::Migration
  def change
    create_table :coupon_tags do |t|
      t.integer :coupon_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
