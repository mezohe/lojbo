class WordEntry
  attr_reader :name, :jbo_type, :definition, :note, :affixes, :etymologies,
              :example, :translation

  def initialize(word_name, language)
    word = Word.find_by(name: word_name)
    @name = word.name
    @jbo_type = word.jbo_type
    @definition = get_definition(word, language)
    @note = get_note(word, language)
    @affixes = word.affixes.map(&:name)
    @etymologies = etymology_entries(word.etymologies)
    @example = word.examples.find_by(language: Language.find(1)).body
    @translation = word.examples.find_by(language: language).body
  end

  def etymology_entries(etymologies)
    etymologies.map do |etymology|
      EtymologyEntry.new(etymology)
    end
  end

  def get_definition(word, language)
    word.definitions.where(language: language).first.body
  end

  def get_note(word, language)
    note = word.notes.where(language: language).first
    note.body if !note.nil?
  end
end
