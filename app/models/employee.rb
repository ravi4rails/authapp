class Employee < ActiveRecord::Base
  belongs_to :employee_type
  has_many :assignments
end
