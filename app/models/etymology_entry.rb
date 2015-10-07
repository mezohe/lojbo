class EtymologyEntry
  attr_reader :language, :roman

  def initialize(etymology)
    @language = etymology.language.iso_code
    @roman = etymology.roman
  end
end
