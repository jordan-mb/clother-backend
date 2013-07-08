class ChangeExpirationToDate < ActiveRecord::Migration
  def change
    change_column :user_coupons, :expiration_date, :date
  end
end
