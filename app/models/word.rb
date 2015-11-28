class Word < ActiveRecord::Base
  has_many :affixes
  has_many :definitions
  has_many :notes
  has_many :etymologies
  has_many :examples
  has_many :synonyms
  has_one :jbo_class

  def self.search_by(word)
    words = Array.new
    words += Word.where(name: word)
    words += Affix.where("name LIKE ?", "%#{word}%").map(&:word)
    words += Etymology.where(etymology: word).map(&:word)
    words += Synonym.where(body: word).map(&:word)
    words.flatten.uniq
  end
end
