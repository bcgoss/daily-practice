module Gigasecond
  GIGASECOND = 1_000_000_000
  def self.from(starting_time)
    starting_time + GIGASECOND
  end

end

module BookKeeping
  VERSION = 5
end
