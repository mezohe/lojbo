gismu = File.open("data/gismu.txt")
cmavo = File.open("data/cmavo.txt")
examples = Nokogiri::HTML(File.open("./data/la_bangu.html"))

jbo = Language.create(iso_code: "jbo")
zh = Language.create(iso_code: "zh")
es = Language.create(iso_code: "es")
en = Language.create(iso_code: "en")
hi = Language.create(iso_code: "hi")
ru = Language.create(iso_code: "ru")

gismu.drop(1).each do |line|
  name = line[1..5].strip.gsub(".", "")
  type = "gismu"
  affixes = line[6..18].split
  definition = line[62..158].strip
  note = line[159..-1].match(/(?<=\[).*(?=\])/).to_s
  word = Word.create(
    name: name,
    jbo_type: type,
    affixes: affixes.map { |affix_name| Affix.new(name: affix_name) },
    definitions: [Definition.new(language: en, body: definition)],
  )
  if note
    word.notes.create(language: en, body: note)
  end
end

cmavo.drop(1).each do |line|
  name = line[0..10].strip.gsub(".", "")
  type = "cmavo"
  jbo_class = line[11..19].strip
  last = line[62..-1]
  note = last.slice!(/\w+ modal, \w+ place/)
  definition = last.strip
  word = Word.create(
    name: name,
    jbo_type: type,
    jbo_class: JboClass.new(code: jbo_class),
    definitions: [Definition.new(language: en, body: definition)],
  )
  if note
    word.notes.create(language: en, body: note)
  end
end

@etymology = Hash.new
@etymology[zh] = File.open("data/lojban-source-words_zh.txt")
@etymology[es] = File.open("data/lojban-source-words_es.txt")
@etymology[en] = File.open("data/lojban-source-words_en.txt")
@etymology[hi] = File.open("data/lojban-source-words_hi.txt")
@etymology[ru] = File.open("data/lojban-source-words_ru.txt")

def create_etymology(lang, ety_part, roman_part)
  @etymology[lang].each do |line|
    if !line.include?("missing")
      line = line.partition("cf.").first
      line = line.split("\t")
      word = line[0]
      script = line[ety_part]
      roman = line[roman_part]
      Word.find_by(name: word).etymologies.create(language: lang,
                                                  etymology: script,
                                                  roman: roman)
    end
  end
end

create_etymology(zh, 3, 5)
create_etymology(es, 3, 3)
create_etymology(en, 3, 3)
create_etymology(hi, 3, 4)
create_etymology(ru, 3, 4)

pattern = /<b>([^<>]+)<\/b> — <i>([^<>]+)<\/i>/
example_strings = examples.css("dd").map(&:to_s).select { |e| e.match(pattern) }
examples_table = example_strings.map do |example|
  groups = example.match(pattern)
  jbo_exam = groups[1].gsub(/(?<=\Ala |\Wla )\w+/, ".\\0.")
  jbo_exam = jbo_exam.gsub(/(?<=\A|\s)([aeiou])/, ".\\1")
  en_exam = groups[2]
  { jbo: jbo_exam, en: en_exam }
end

Word.all.each do |word|
  name = word.name
  pattern = /[\A\W]#{Regexp.escape name}[\z\W]/
  has_word = examples_table.select { |e| e[:jbo].match(pattern) }
  desired_length = has_word.sort_by { |e| (e[:jbo].split.length - 8).abs }
  example = desired_length.first
  if example
    word.examples.create(language: jbo, body: example[:jbo])
    word.examples.create(language: en, body: example[:en])
  end
end

@synonyms = Hash.new
@synonyms[en] = JSON.parse(File.open("data/synonyms_en.json").read)

@synonyms.map do |language, list|
  list.each do |word_name, synonym_list|
    synonym_list.each do |synonym|
      begin
        Word.find_by(name: word_name).synonyms.create(language: language,
                                                      body: synonym)
      rescue
        puts word_name
      end
    end
  end
end
