class SongnotesController < ApplicationController
  before_action :set_songnote, only: [:show, :edit, :update, :destroy]

  # GET /songnotes
  # GET /songnotes.json
  def index
    @songnotes = Songnote.order(:songtitle, :measure)
  end

  # GET /songnotes/1
  # GET /songnotes/1.json
  def show
  end

  # GET /songnotes/new
  def new
    @songnote = Songnote.new
  end

  # GET /songnotes/1/edit
  def edit
  end

  # POST /songnotes
  # POST /songnotes.json
  def create
    @songnote = Songnote.new(songnote_params)

    respond_to do |format|
      if @songnote.save
        format.html { redirect_to @songnote, notice: 'Songnote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @songnote }
      else
        format.html { render action: 'new' }
        format.json { render json: @songnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songnotes/1
  # PATCH/PUT /songnotes/1.json
  def update
    respond_to do |format|
      if @songnote.update(songnote_params)
        format.html { redirect_to @songnote, notice: 'Songnote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @songnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songnotes/1
  # DELETE /songnotes/1.json
  def destroy
    @songnote.destroy
    respond_to do |format|
      format.html { redirect_to songnotes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_songnote
      @songnote = Songnote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def songnote_params
      params.require(:songnote).permit(:songtitle, :page, :xcoordinate, :ycoordinate, :measure, :note)
    end
end
