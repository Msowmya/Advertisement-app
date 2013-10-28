class AddIndexToAdsUserId < ActiveRecord::Migration
  def change
    add_index :ads, :user_id
  end
end
