class Resident < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :occupation, presence: true

  has_many :resident_courses
  has_many :courses, through: :resident_courses
  def self.average_age
    average(:age).to_f.round(1)
  end
end
