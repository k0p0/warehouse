class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reservations, dependent: :nullify
  has_many :storehouses, dependent: :nullify
  validates :name, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false
  #mount_uploader :picture, PictureUploader
end
