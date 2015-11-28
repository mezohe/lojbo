class Etymology < ActiveRecord::Base
  belongs_to :word
  belongs_to :language

  def wiktionary_link

  end
end
