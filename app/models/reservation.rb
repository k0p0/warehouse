class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :storehouse
  validates :starts_on, presence: true
  validates :ends_on, presence: true
end
