class AvailabilitySlot < ApplicationRecord
  validates :start_time, presence: true
  validates :duration, presence: true
  validate :teacher_xor_resource

  belongs_to :teacher, optional: true
  belongs_to :resource, optional: true

  def end_time
    start_time + duration.seconds
  end

  private

  def teacher_xor_resource
    unless teacher_id.blank? ^ resource_id.blank?
      errors.add(:base, "an Availability_slot must belong to a teacher OR resource. And not both.")
    end
  end

end
