module Binary
  def self.to_decimal bitstream
    raise NonbinaryError unless bitstream =~ /\A[01]*\z/
    power = 0
    bitstream.reverse.chars.inject(0) do |total, bit|
      total += bit.to_i * 2 ** power
      power += 1
      total
    end
  end

  class NonbinaryError < ArgumentError
    def message
      'Input should be only 1s or 0s'
    end
  end
end

module BookKeeping
  VERSION = 3
end
