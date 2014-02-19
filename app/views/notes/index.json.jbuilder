json.array!(@notes) do |note|
  json.extract! note, :id, :note, :pages, :source, :author, :url, :date
  json.url note_url(note, format: :json)
end
