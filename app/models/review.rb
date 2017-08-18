class Review < ApplicationRecord
  belongs_to :storehouse
  validates :content, length: { minimum: 5 }
  validates :rating, presence: :true
end
