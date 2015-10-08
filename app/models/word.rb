class Word < ActiveRecord::Base
  has_many :affixes
  has_many :definitions
  has_many :notes
  has_many :etymologies
  has_many :examples
  has_one :jbo_class
end
