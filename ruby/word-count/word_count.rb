class Phrase
  attr_reader :phrase

  def initialize phrase
    @phrase = phrase.gsub(/[,!\.&@$%^:]/, ' ').downcase
  end

  def word_count
    @phrase.split.reduce({}) do |counts, word|
      match = word.match(/'(\w+)'/)
      if match
        word = match.captures.first
      end
      counts[word] = (counts[word] || 0) + 1
      counts
    end
  end
end
