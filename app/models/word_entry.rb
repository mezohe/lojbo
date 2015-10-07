class WordEntry
  attr_reader :name, :jbo_type, :definition, :note, :affixes, :etymologies

  def initialize(word, iso_code)
    language = Language.find_by(iso_code: iso_code)
    @name = word.name
    @jbo_type = word.jbo_type
    @definition = get_definition(word, language)
    @note = get_note(word, language)
    @affixes = word.affixes
    @etymologies = word.etymologies
  end

  def get_definition(word, language)
    word.definitions.where(language: language).first.body
  end

  def get_note(word, language)
    word.notes.where(language: language).first.body
  end
end
