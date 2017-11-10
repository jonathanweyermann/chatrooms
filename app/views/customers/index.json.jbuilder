json.array!(@helpchats) do |helpchat|
  json.extract! helpchat, :id, :name
  json.url helpchat_url(helpchat, format: :json)
end
