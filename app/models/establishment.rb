class Establishment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :siret, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  geocoded_by :address
  after_validation :geocode
end
