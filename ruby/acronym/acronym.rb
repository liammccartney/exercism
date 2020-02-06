module Acronym
  def self.abbreviate words
    words.split(/\s|\-/).reduce('') do |acronym, word|
      if word.empty?
        acronym
      else
        acronym + word[0].upcase
      end
    end
  end
end
