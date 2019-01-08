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

  has_many :services, dependent: :destroy
  has_many :events, through: :services, dependent: :destroy
  has_many :establishments, -> { distinct }, through: :services
  has_one_attached :avatar
  
  after_create :welcome_send, :avatar_attach

  def upcoming_events
    events.order(start_time: :desc).select { |e| e.start_time > (DateTime.now- 1.week) }
  end


  def avatar_attach
    temp_user = self
    temp_user.avatar.attach(io: File.open("app/assets/images/neutral.jpeg"), filename: 'avatar')
  end

  
  def welcome_send
    ContactMailer.welcome_send(self).deliver_now
  end

end
