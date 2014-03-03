class SongsController < ApplicationController

  def index
    @pieces = Piece.all(:order => 'date, positionincycle')
  end


end
