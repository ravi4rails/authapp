class Assignment < ActiveRecord::Base
  belongs_to :employee
  has_many :assignment_tasks
end
