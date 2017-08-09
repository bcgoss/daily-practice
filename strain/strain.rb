module Strain
  def keep(&block)
    self.inject([]) do |result, element|
      result << element if yield element
      result
    end
  end

  def discard(&block)
    self.inject([]) do |result, element|
      result << element unless yield element
      result
    end
  end
end

class Array
  include Strain
end
