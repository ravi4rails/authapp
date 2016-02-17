json.array!(@news) do |news|
  json.extract! news, :id, :title, :published_on, :content
  json.url news_url(news, format: :json)
end
