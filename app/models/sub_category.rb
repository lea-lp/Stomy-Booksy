class SubCategory < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :teachers
  has_many :services, dependent: :destroy
end
