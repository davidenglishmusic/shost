class SongsController < ApplicationController

  def index
    @pieces = Piece.all(:order => 'date, positionInCycle')
  end


end
