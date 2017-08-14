class Storehouse < ApplicationRecord
  belongs_to :user
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy
  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :address, presence: true, uniqueness: true, allow_blank: false
  validates :capacity, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
end
