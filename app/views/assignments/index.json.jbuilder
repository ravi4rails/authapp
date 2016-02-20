json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :submission_date, :grade, :employee_id
  json.url assignment_url(assignment, format: :json)
end
