json.array!(@rarities) do |rarity|
  json.extract! rarity, :id, :name, :color
  json.url rarity_url(rarity, format: :json)
end
