class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.text :contact_details
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
