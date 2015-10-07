class Definition < ActiveRecord::Base
  belongs_to :word
  belongs_to :language
end
