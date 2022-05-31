class Item < ApplicationRecord
  CATEGORIES = ["Computers & Accessories", "Home & Kitchen", "Camping", "Sports & Outdoors", "Tools & DIY"]
  validates :category, inclusion: { in: CATEGORIES }
  CONDITIONS = ["Like new", "Very good", "Good", "Acceptable"]
  validates :condition, inclusion: { in: CONDITIONS }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo
end
