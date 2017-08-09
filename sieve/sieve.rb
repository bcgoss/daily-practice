require 'set'

class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if limit < 2
    numbers = Set.new(2..limit)
    composites = Set.new
    numbers.each do |number|
      composites.merge( multiples(number) ) unless composites.include? number
    end
    (numbers - composites).to_a
  end

  def multiples(number)
    (number+1..limit).find_all { |subject| subject % number == 0 }
  end
end

module BookKeeping
  VERSION = 1
end
