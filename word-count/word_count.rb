class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    clean_phrase(@phrase).split(' ').inject(Hash.new(0)) do |words, word|
      words[word] += 1
      words
    end
  end

  def clean_phrase(phrase)
    phrase.gsub(/ \'/, ' ')
    .gsub(/\' /, ' ')
    .downcase.gsub /[^\w\s\d']/, ' '
  end
end

module BookKeeping
  VERSION = 1
end
