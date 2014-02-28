class SongsController < ApplicationController

  def index
    @pieces = Piece.all
  end


end
