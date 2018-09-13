class PiecesController < ApplicationController
  before_action :set_piece, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @pieces = Piece.order(:date, :positionincycle)
  end

  def show; end

  def new
    @piece = Piece.new
  end

  def edit; end

  def create
    @piece = Piece.new(piece_params)

    respond_to do |format|
      if @piece.save
        format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        format.json { render action: 'show', status: :created, location: @piece }
      else
        format.html { render action: 'new' }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @piece.destroy
    respond_to do |format|
      format.html { redirect_to pieces_url }
      format.json { head :no_content }
    end
  end

  private

  def set_piece
    @piece = Piece.find(params[:id])
  end

  def piece_params
    params.require(:piece)
          .permit(:title, :composer, :author, :date, :opus, :pages, :positionincycle, :imageURLs, :originalText, :transliterationText, :translationText)
  end
end
