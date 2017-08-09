class Fixnum
  THOUSANDS = ['', 'M', 'MM', 'MMM']
  HUNDREDS = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
  TENS = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
  ONES = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']

  def to_roman
    numeral = THOUSANDS[self / 1000 ]
    numeral += HUNDREDS[(self % 1000) / 100]
    numeral += TENS[(self % 100) / 10]
    numeral += ONES[self % 10]
  end
end

module BookKeeping
  VERSION = 2
end
