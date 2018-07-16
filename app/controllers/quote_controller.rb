class QuoteController < ApplicationController
  def index
    @notes = Note.all
  end
end
