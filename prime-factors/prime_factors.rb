# Recursively breaks a positive number into prime factors
module PrimeFactors
  def self.for(number)
    return [] if number < 2
    factorize(number).flatten.sort
  end

  def self.factorize(subject)
    factor = Math.sqrt(subject).floor.downto(2).find do |candidate|
      (subject % candidate).zero?
    end
    if factor
      [factorize(factor), factorize(subject / factor)]
    else
      [subject]
    end
  end
end
