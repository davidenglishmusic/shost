class SongsController < ApplicationController
  def index
    @pieces = Piece.order(:date, :positionincycle)
  end
end
