class Resource < ApplicationRecord
  validates :resource_type, presence: true, :inclusion=> { :in => ['salle'] }
  validates :name, presence: true

  after_initialize :init

  belongs_to :establishment

  def init
    self.is_active = true if self.is_active.nil?
  end
end
