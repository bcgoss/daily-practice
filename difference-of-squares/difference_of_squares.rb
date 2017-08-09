module BookKeeping
  VERSION = 3
end

class Squares
  def initialize(maximum)
    @maximum = maximum
  end

  def square_of_sum
    # Sum of first N numbers:  N * (N + 1) / 2
    ((@maximum ** 2 + @maximum) / 2) ** 2
  end

  def sum_of_squares
    # Sum of first N squares:  (N * (N + 1) * (2N + 1)) / 6
    @maximum * (@maximum + 1) * (2 * @maximum + 1) / 6
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
