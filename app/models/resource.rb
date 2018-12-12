class Resource < ApplicationRecord
  validates :resource_type, presence: true, :inclusion=> { :in => ['salle','objet'] }
  validates :name, presence: true

  after_initialize :init

  belongs_to :establishment
  has_many :events, dependent: :destroy
  has_many :services, dependent: :destroy
  

  def init
    self.is_active = true if self.is_active.nil?
  end

  def upcoming_events
    events.order(start_time: :desc).select { |e| e.start_time > (DateTime.now- 1.week) }
  end
end
