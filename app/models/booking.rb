class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :messages
  has_many :reviews, dependent: :destroy
end
