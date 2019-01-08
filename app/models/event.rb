class Event < ApplicationRecord
  validates :start_time, presence: true
  validate :no_over_night_event # we will block events that are spread on 2 different days (to simplify the overlap testing)
  validate :no_overlaping_event


  belongs_to :service
  belongs_to :student
  has_one :teacher, through: :service
  has_one :resource, through: :service
  has_one :establishment, through: :service

  def end_time
    self.start_time + self.service.duration.seconds
  end

  def set_event_name
    self.name = "RDV "+self.student.first_name+" "+self.student.last_name[0]+". avec "+self.teacher.first_name+" à "+self.establishment.name+" (salle: "+self.resource.name+")"
  end

  def duration
    self.service.duration
  end

  def no_overlaping_event
    #getting all the events one the same day for the student, the teacher and the resource.
    student_events = self.student.events.select{ |e| e.start_time.midnight == self.start_time.midnight}
    resource_events = self.resource.events.select{ |e| e.start_time.midnight == self.start_time.midnight}
    teacher_events = self.teacher.events.select{ |e| e.start_time.midnight == self.start_time.midnight}

    # makes sure that current appointments don’t overlap:
      # 1)first checks if an existing appointment is still in progress when the new appointment is set to start
      # 2)next checks if the new appointment would still be in progress when an existing appointment is set to start

    student_events.each do |student_event|
      unless student_event == self
        if self.start_time >= student_event.start_time  && self.start_time < student_event.end_time || self.start_time <= student_event.start_time && student_event.start_time < self.end_time
          errors.add(:start_time, "L'élève n'est pas dispo sur ce créneau.")
        end
      end
    end

    resource_events.each do |resource_event|
      unless resource_event == self
        if self.start_time >= resource_event.start_time  && self.start_time < resource_event.end_time || self.start_time <= resource_event.start_time && resource_event.start_time < self.end_time
          errors.add(:start_time, "La ressource n'est pas dispo sur ce créneau.")
        end
      end
    end

    teacher_events.each do |teacher_event|
      unless teacher_event == self
        if self.start_time >= teacher_event.start_time  && self.start_time < teacher_event.end_time || self.start_time <= teacher_event.start_time && teacher_event.start_time < self.end_time
          errors.add(:start_time, "Le professeur n'est pas dispo sur ce créneau.")
        end
      end
    end
  end

  private

  def no_over_night_event
    if self.end_time.midnight != self.start_time.midnight
      errors.add(:duration, "Un évènement ne peut pas s'étaler sur 2 jours. Merci de le scinder en 2.")
    end
  end
end
