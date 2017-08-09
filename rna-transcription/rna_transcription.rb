# Convert DNA to RNA based on matching pairs.
module Complement
  PAIRS = { 'G' => 'C', 'C' => 'G', 'A' => 'U', 'T' => 'A' }.freeze

  def self.of_dna(strand)
    nucleotides = strand.split('')
    valid?(nucleotides) ? convert(nucleotides) : ''
  end

  def self.valid?(nucleotides)
    nucleotides.all? { |nucleotide| PAIRS.keys.include? nucleotide }
  end

  def self.convert(nucleotides)
    nucleotides.map { |nucleotide| PAIRS[nucleotide] }.join
  end
end

module BookKeeping
  VERSION = 4
end
