class ScoreviewController < ApplicationController

  def show
	urlArray = Piece.find(params[:id]).imageURLs.split("\r\n")
	@URL = urlArray[(params[:pages]).to_i]
  end

end
