class Ad < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 50}
 # scope :approved, -> { where(approved: true) }
end
