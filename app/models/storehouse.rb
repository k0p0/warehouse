class Storehouse < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :address, presence: true, uniqueness: true, allow_blank: false
  validates :capacity, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
end
