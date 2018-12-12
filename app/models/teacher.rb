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

  has_many :events, dependent: :destroy
  has_many :services
  has_many :establishments, -> { distinct }, through: :services

  def upcoming_events
    events.order(start_time: :desc).select { |e| e.start_time > (DateTime.now- 1.week) }
  end

  after_create :welcome_send
  def welcome_send
    ContactMailer.welcome_send(self).deliver
  end

end
