class SongsController < ApplicationController

  def index
    @pieces = Piece.order(:date, :positionInCycle)
  end


end
