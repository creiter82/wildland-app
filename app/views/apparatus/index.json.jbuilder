json.array!(@apparatus) do |apparatu|
  json.extract! apparatu, :id, :name
  json.url apparatu_url(apparatu, format: :json)
end
