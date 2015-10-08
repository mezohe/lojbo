class EtymologyEntry
  attr_reader :language, :roman, :wiktionary_link

  def initialize(etymology)
    @language = etymology.language.iso_code
    @roman = etymology.roman
    code = etymology.language.iso_code
    script = etymology.etymology
    @wiktionary_link = "https://#{code}.wiktionary.org/wiki/#{script}"
  end
end
