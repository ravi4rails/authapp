json.array!(@assignment_tasks) do |assignment_task|
  json.extract! assignment_task, :id, :title, :description, :assignment_id
  json.url assignment_task_url(assignment_task, format: :json)
end
