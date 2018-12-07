class Establishment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :siret, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  has_and_belongs_to_many :teachers
  has_many :resources, dependent: :destroy
  has_many :events, through: :resources

  geocoded_by :address
  after_validation :geocode

  def upcoming_events
    events.order(start_time: :desc).select { |e| e.start_time > (DateTime.now) }
  end
end
