module Prime
  def self.nth(goal)
    raise LowerBoundError, 'Use positive integers' if goal < 1
    return 2 if goal == 1
    primes_found = 2
    highest_prime = 3
    while primes_found < goal do
      highest_prime = next_prime(highest_prime)
      primes_found +=1
    end
    highest_prime
  end

  def self.next_prime(candidate)
    # Matz dislikes do-while loops, suggests this form
    # http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/6745
    loop do
      candidate = step_up(candidate)
      break unless (2..Math.sqrt(candidate)).any? { |factor| (candidate % factor).zero? }
    end
    candidate
  end

  def self.step_up(previous_prime)
    # 2 is the only even prime. Each prev_prime after 2 will be ood
    # so step_up size of 2 skips even numbers as long as we start with 3
    previous_prime + 2
  end

  LowerBoundError = Class.new(ArgumentError)
end

module BookKeeping
  VERSION = 1
end
