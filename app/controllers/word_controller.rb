class WordController < ApplicationController
  def show
    #begin
      @word = WordEntry.new(params[:slug], Language.find_by(iso_code: "en"))
    #rescue
      #render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    #end
  end
end
