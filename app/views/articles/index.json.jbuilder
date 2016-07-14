json.array!(@articles) do |article|
  json.extract! article, :id, :headline, :slug, :intro, :body
  json.url article_url(article, format: :json)
end
