class SongnotesController < ApplicationController
  before_action :set_songnote, only: %i[show edit update destroy]

  def index
    @song_notes = Songnote.order(:songtitle, :measure)
  end

  def show; end

  def new
    @song_note = Songnote.new
  end

  def edit; end

  def create
    @song_note = Songnote.new(songnote_params)

    respond_to do |format|
      if @song_note.save
        format.html { redirect_to @song_note, notice: 'Songnote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song_note }
      else
        format.html { render action: 'new' }
        format.json { render json: @song_note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song_note.update(songnote_params)
        format.html { redirect_to @song_note, notice: 'Songnote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song_note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song_note.destroy
    respond_to do |format|
      format.html { redirect_to songnotes_url }
      format.json { head :no_content }
    end
  end

  private

  def set_songnote
    @song_note = Songnote.find(params[:id])
  end

  def songnote_params
    params.require(:songnote).permit(:songtitle, :page, :xcoordinate, :ycoordinate, :measure, :note)
  end
end
