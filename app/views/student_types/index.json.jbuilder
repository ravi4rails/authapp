json.array!(@student_types) do |student_type|
  json.extract! student_type, :id, :name, :student_category_id
  json.url student_type_url(student_type, format: :json)
end
