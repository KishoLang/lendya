class Item < ApplicationRecord
  CATEGORIES = ["Computers & Accessories", "Home & Kitchen", "Camping", "Sports & Outdoors", "Tools & DIY"]
  validates :category, inclusion: { in: CATEGORIES }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end
