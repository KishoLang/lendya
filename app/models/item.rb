class Item < ApplicationRecord
  CATEGORIES = ["Computers & Accessories", "Home & Kitchen", "Camping", "Sports & Outdoors", "Tools & DIY"]
  validates :category, inclusion: { in: CATEGORIES }
  CONDITIONS = ["Like new", "Very good", "Good", "Acceptable"]
  validates :condition, inclusion: { in: CONDITIONS }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo

#  geocoded_by :address, through: :users
#  after_validation :geocode, if: :will_save_change_to_address?

  def average
   if self.reviews.pluck(:rating).size.zero?
     0
   else
    ratings = 0
    self.reviews.pluck(:rating).each do |rating|
     ratings += rating
    end
    ratings / self.reviews.pluck(:rating).size
   end
  end

  def stars
    star_number = self.average.to_i
    star = "<i class='fas fa-star'></i>"
    star * star_number
  end
end
