class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student, uniqueness: { scope: :course }
end
