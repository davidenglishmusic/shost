class ScoreviewController < ApplicationController
  def show
    song_id = params[:id].to_i
    piece = Piece.find(song_id)
    @score_page = params[:pages].to_i

    url_array = piece.imageURLs.split("\r\n")
    @url = url_array[@score_page]

    next_score_page = @score_page >= (url_array.length - 1) ? @score_page : @score_page + 1
    @forward_page_url = "/songs/#{song_id}/score_page/#{next_score_page}"

    previous_score_page = @score_page <= 0 ? @score_page : @score_page - 1
    @previous_page_url = "/songs/#{song_id}/score_page/#{previous_score_page}"

    @song_title = piece.title
    @previous_notes = Songnote.where(songtitle: @song_title, page: @score_page)
                              .select(:xcoordinate, :ycoordinate, :measure, :note)
                              .as_json
  end
end
