class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :siret, presence: true
  validates :phone, presence: true

  has_and_belongs_to_many :sub_categories
  has_and_belongs_to_many :establishments

  has_many :availablity_slots
  has_many :events

end
