class Resource < ApplicationRecord
  validates :resource_type, presence: true, :inclusion=> { :in => ['salle','objet'] }
  validates :name, presence: true

  after_initialize :init

  belongs_to :establishment
  has_many :availablity_slots
  has_many :events
  

  def init
    self.is_active = true if self.is_active.nil?
  end
end
