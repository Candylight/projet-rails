json.array!(@hs_classes) do |hs_class|
  json.extract! hs_class, :id, :name, :color, :hero_power
  json.url hs_class_url(hs_class, format: :json)
end
