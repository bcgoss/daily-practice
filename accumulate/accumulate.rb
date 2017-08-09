module Accumulate
  def accumulate
    return self.to_enum unless block_given?
    index = 0
    result = []
    while index < self.size do
      result << yield(self[index])
      index += 1
    end
    result
  end
end

class Array
  include Accumulate

end

module BookKeeping
  VERSION = 1
end
