
class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :events

  def upcoming_events
    events.order(start_time: :desc).select { |e| e.start_time > (DateTime.now- 1.week) }
  end

end
