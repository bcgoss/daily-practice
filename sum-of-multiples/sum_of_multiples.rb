# Accepts a list of factors
# Calculates the sum of all multiples up to a maximum
class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(maximum)
    return 0 if factors == [] || maximum < factors.min
    (0...maximum).select {|number| multiples? number }.inject(:+)
  end

  private
  attr_reader :factors

  def multiples?(number)
    factors.any? { |factor| (number % factor).zero? }
  end
end

module BookKeeping
  VERSION = 1
end
