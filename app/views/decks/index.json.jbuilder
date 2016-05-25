json.array!(@decks) do |deck|
  json.extract! deck, :id, :name, :description, :views, :mark
  json.url deck_url(deck, format: :json)
end
