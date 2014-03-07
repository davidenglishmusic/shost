class ScoreeditController < ApplicationController
  def show
	urlArray = Piece.find(params[:id]).imageURLs.split("\r\n")
	@URL = urlArray[(params[:pages]).to_i]

	songComponent = params[:id].to_i
	songPageComponent = (params[:pages].to_i)

	if ( (params[:pages].to_i) >= (urlArray.length - 1) )
		@forwardPageURL = "/pieces/#{songComponent}/#{songPageComponent}"
	else
		nextPageNumber = songPageComponent + 1
		@forwardPageURL = "/pieces/#{songComponent}/#{nextPageNumber}"
	end

	if ( (params[:pages].to_i) <= 0 )
		@previousPageURL = "/pieces/#{songComponent}/#{songPageComponent}"
	else
		previousPageNumber = songPageComponent - 1
		@previousPageURL = "/pieces/#{songComponent}/#{previousPageNumber}"
	end
	
	@songTitle = Piece.find(params[:id]).title
	@pageNumber = (params[:pages]).to_i
	@songnote = Songnote.new
	@previousNotes = Songnote.where(songtitle: @songTitle, page: (@pageNumber.to_i))

  end
end
