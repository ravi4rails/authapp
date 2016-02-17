class Student < ActiveRecord::Base
  belongs_to :student_type
  scope :current_students, -> {joins(:student_type).where(student_types: { name: 'Current' })}
  scope :previous_students, -> {joins(:student_type).where(student_types: { name: 'Previous' })}
end