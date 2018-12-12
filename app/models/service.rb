class Service < ApplicationRecord
  validates :name, presence: true
  validates :duration, presence: true
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 900, less_than_or_equal_to: 14400 }
  validate :resource_belongs_to_establishment
  validate :subcategory_belongs_to_teacher

  belongs_to :establishment
  belongs_to :teacher
  belongs_to :resource
  belongs_to :sub_category

  private

  def resource_belongs_to_establishment
    unless self.establishment.resources.include?(self.resource)
      errors.add(:resource, "La ressource affiliée n'appartient pas à l'établissement affilié.")
    end
  end

  def subcategory_belongs_to_teacher
    unless self.teacher.sub_categories.include?(self.sub_category)
      errors.add(:sub_category, "La sous-catégorie n'est pas enseignée par ce professeur.")
    end
  end

end
