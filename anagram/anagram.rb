class Anagram
  def initialize(source_word)
    @source_word = source_word
  end

  def match(guesses)
    guesses.select do |guess|
      prepare(guess) == prepare(@source_word) unless identical? guess
    end.uniq
  end

  def identical?(guess)
    guess.downcase == @source_word.downcase
  end

  def prepare(word)
    word.downcase.chars.sort
  end
end

module BookKeeping
  VERSION = 2
end
