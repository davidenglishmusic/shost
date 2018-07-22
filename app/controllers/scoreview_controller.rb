class ScoreviewController < ApplicationController
  def show
    url_array = Piece.find(params[:id]).imageURLs.split("\r\n")
    @url = url_array[params[:pages].to_i]

    song_component = params[:id].to_i
    song_page_component = params[:pages].to_i

    if params[:pages].to_i >= (url_array.length - 1)
      @forward_page_url = "/songs/#{song_component}/score_page/#{song_page_component}"
    else
      next_page_number = song_page_component + 1
      @forward_page_url = "/songs/#{song_component}/score_page/#{next_page_number}"
    end

    if params[:pages].to_i <= 0
      @previous_page_url = "/songs/#{song_component}/score_page/#{song_page_component}"
    else
      previous_page_number = song_page_component - 1
      @previous_page_url = "/songs/#{song_component}/score_page/#{previous_page_number}"
    end

    @song_title = Piece.find(params[:id]).title
    @page_number = params[:pages].to_i

    @previous_notes = Songnote.where(songtitle: @song_title, page: @page_number)
  end
end
