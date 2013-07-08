class ModifyValidFor < ActiveRecord::Migration
  def change
    remove_column :coupons, :valid_for
    add_column :coupons, :days_valid_for, :integer
  end
end
