json.array!(@pieces) do |piece|
  json.extract! piece, :id, :title, :composer, :author, :date, :opus, :pages, :positionincycle, :imageURLs, :originalText, :transliterationText, :translationText
  json.url piece_url(piece, format: :json)
end
