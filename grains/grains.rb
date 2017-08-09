# Starting with one grain of rice, traverse a chess board and
# double the number of grains for each square
# #square returns grains after a number of squares
# #total returns grains on all squares.
module Grains
  BOARD_SIZE = 64

  def self.square(last_square)
    raise OutOfBoundsError unless (1..BOARD_SIZE).cover? last_square
    2**(last_square - 1)
  end

  def self.total
    (1..BOARD_SIZE).inject { |total, current_square| total + square(current_square) }
  end

  class OutOfBoundsError < ArgumentError
    def initialize(msg = "Use a number between 1 and #{BOARD_SIZE}, inclusive")
      super
    end
  end
end

module BookKeeping
  VERSION = 1
end
