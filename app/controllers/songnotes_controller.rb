class SongnotesController < ApplicationController
  before_action :set_songnote, only: [:show, :edit, :update, :destroy]

  # GET /songnotes
  # GET /songnotes.json
  def index
    @song_notes = Songnote.order(:songtitle, :measure)
  end

  # GET /songnotes/1
  # GET /songnotes/1.json
  def show
  end

  # GET /songnotes/new
  def new
    @song_note = Songnote.new
  end

  # GET /songnotes/1/edit
  def edit
  end

  # POST /songnotes
  # POST /songnotes.json
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

  # PATCH/PUT /songnotes/1
  # PATCH/PUT /songnotes/1.json
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

  # DELETE /songnotes/1
  # DELETE /songnotes/1.json
  def destroy
    @song_note.destroy
    respond_to do |format|
      format.html { redirect_to songnotes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_songnote
      @song_note = Songnote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def songnote_params
      params.require(:songnote).permit(:songtitle, :page, :xcoordinate, :ycoordinate, :measure, :note)
    end
end
