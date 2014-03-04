class ScoreviewController < ApplicationController

  def show
	urlArray = Piece.find(params[:id]).imageURLs.split("\r\n")
	@URL = urlArray[(params[:pages]).to_i]

	songComponent = params[:id].to_i
	songPageComponent = (params[:pages].to_i)

	if ( (params[:pages].to_i) >= (urlArray.length - 1) )
		@forwardPageURL = "/songs/#{songComponent}/#{songPageComponent}"
	
	else
		nextPageNumber = songPageComponent + 1
		@forwardPageURL = "/songs/#{songComponent}/#{nextPageNumber}"

	end

	if ( (params[:pages].to_i) <= 0 )
		@previousPageURL = "/songs/#{songComponent}/#{songPageComponent}"
	else
		previousPageNumber = songPageComponent - 1
		@previousPageURL = "/songs/#{songComponent}/#{previousPageNumber}"
	end
  end

end
