class Event < ApplicationRecord
  validates :start_time, presence: true
  validates :duration, presence: true
  validate :teacher_xor_resource


  belongs_to :student, dependent: :destroy
  belongs_to :teacher, dependent: :destroy
  belongs_to :resource, dependent: :destroy
  has_one :establishment, through: :resources

  def end_time
    start_time + duration.seconds
  end

  private

  def 
      errors.add(:base, "an Availability_slot must belong to a teacher OR resource. And not both.")

  end

end
