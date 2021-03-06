class Storehouse < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  # has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy
  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :address, presence: true, uniqueness: true, allow_blank: false
  validates :capacity, presence: true, allow_blank: false
  validates :day_price, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  mount_uploader :picture, PictureUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
