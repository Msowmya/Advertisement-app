class AddApprovedToAds < ActiveRecord::Migration
  def change
    add_column :ads, :approved, :boolean, default: false
  end
end
