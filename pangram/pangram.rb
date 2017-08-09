require 'set'

module Pangram
  ALPHABET = Set.new 'a'..'z'
  def self.pangram?(phrase)
    ALPHABET.subset? Set.new(phrase.downcase.chars)
  end
end

module BookKeeping
  VERSION = 4
end
