json.array!(@songnotes) do |songnote|
  json.extract! songnote, :id, :songtitle, :page, :xcoordinate, :ycoordinate, :measure, :note
  json.url songnote_url(songnote, format: :json)
end
