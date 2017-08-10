# Sings a song about alcoholism
class BeerSong
  def initialize(max_bottles = 99)
    @max_bottles = max_bottles
  end

  def verse(num)
    @number = num
    first_line + second_line
  end

  def verses(first, last)
    first.downto(last).inject([]) do |song, number|
      song << verse(number)
    end.join("\n")
  end

  private

  attr_reader :number

  def first_line
    quantity(number).capitalize + ' of beer on the wall, ' \
    + quantity(number) + " of beer.\n"
  end

  def quantity(number)
    if number == -1
      quantity(@max_bottles)
    elsif number.zero?
      'no more bottles'
    elsif number == 1
      "#{number} bottle"
    else
      "#{number} bottles"
    end
  end

  def second_line
    take_down + quantity(number.pred) + " of beer on the wall.\n"
  end

  def take_down
    if number.zero?
      'Go to the store and buy some more, '
    else
      "Take #{pronoun} down and pass it around, "
    end
  end

  def pronoun
    number == 1 ? 'it' : 'one'
  end
end

module BookKeeping
  VERSION = 3
end
