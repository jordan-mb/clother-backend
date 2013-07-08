class CreateCoupon < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :percent_off
      t.string :store
      t.string :clothing_name
      t.datetime :valid_for
      t.integer :full_price

      t.timestamps
    end
  end
end
