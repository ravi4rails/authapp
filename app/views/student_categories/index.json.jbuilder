json.array!(@student_categories) do |student_category|
  json.extract! student_category, :id, :name
  json.url student_category_url(student_category, format: :json)
end
