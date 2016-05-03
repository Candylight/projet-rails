json.array!(@extensions) do |extension|
  json.extract! extension, :id, :name, :release, :standard
  json.url extension_url(extension, format: :json)
end
