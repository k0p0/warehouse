class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :storehouse
  validates :start_on, presence: true
  validates :end_on, presence: true
end
