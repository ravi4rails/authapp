json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :middle_name, :last_name, :student_type_id
  json.url student_url(student, format: :json)
end
