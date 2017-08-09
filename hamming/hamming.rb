module Hamming
  def self.compute(first_strand, second_strand)
    raise ArgumentError if first_strand.length != second_strand.length
    diff = 0
    first_strand.each_char.with_index do |char, index|
      diff += 1 if char != second_strand.chars[index]
    end
    diff
  end
end

module BookKeeping
  VERSION = 3
end
