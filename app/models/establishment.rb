class Establishment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :siret, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  has_many :services, dependent: :destroy
  has_many :teachers, -> { distinct }, through: :services
  has_many :resources, dependent: :destroy
  has_many :events, through: :resources
  has_one_attached :avatar

  geocoded_by :address
  after_validation :geocode
  
  after_create :welcome_send, :avatar_attach

  def upcoming_events
    events.order(start_time: :asc).select { |e| e.start_time > (DateTime.now) }
  end


  def avatar_attach
    temp_user = self
    temp_user.avatar.attach(io: File.open("app/assets/images/neutral.jpeg"), filename: 'avatar')
  end


  def welcome_send
    ContactMailer.welcome_send(self).deliver_now
  end
  
end
