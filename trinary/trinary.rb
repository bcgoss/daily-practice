# Convert a string to a decimal number
class Trinary
  attr_reader :digits
  def initialize(digits)
    @digits = digits.chars.map(&:to_i).reverse
    @digits = [0] unless digits =~ /\A[0-3]*\z/
  end

  def to_decimal
    digits.each_with_index.reduce(0) do |sum, digit|
      sum + digit[0] * 3**digit[1]
    end
  end
end

module BookKeeping
  VERSION = 1
end
