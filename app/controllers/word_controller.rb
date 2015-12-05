class WordController < ApplicationController
  def show
    @word = WordEntry.new(params[:slug], Language.find_by(iso_code: "en"))
  rescue
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def search
    words = Word.search_by(params["synonym"]["body"])
    @words = words.map do |word|
      if entry = WordEntry.new(word.name, Language.find_by(iso_code: "en"))
        entry
      end
    end
  end
end
