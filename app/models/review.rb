class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :item, through: :booking

  # validates :content, presence: true
  # validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end
