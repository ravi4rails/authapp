class StudentType < ActiveRecord::Base
  belongs_to :student_category
  has_many :students
end
