# Collect rolls and score a game of bowling
class Game
  def initialize
    @frames = [Frame.new]
  end

  def roll(pins)
    raise BowlingError unless (0..10).cover? pins
    raise BowlingError if game_complete?
    add_bonus_pins(pins)
    @frames.push(Frame.new) if frame_needed?
    @frames.last.add_roll(pins) unless @frames.last.done?
  end

  def score
    raise BowlingError unless game_complete?
    @frames.map(&:value).reduce(:+)
  end

  private

  def add_bonus_pins(pins)
    frames_awaiting_bonus.each { |frame| frame.add_bonus_pins(pins) }
  end

  def frames_awaiting_bonus
    @frames.select(&:needs_bonus?)
  end

  def game_complete?
    bonus_frames_complete? && all_frames_complete?
  end

  def bonus_frames_complete?
    frames_awaiting_bonus.empty?
  end

  def all_frames_complete?
    @frames.last.done? && @frames.size == 10
  end

  def frame_needed?
    @frames.last.done? && @frames.size < 10
  end

  # Customized error
  BowlingError = Class.new(StandardError)

  # Handle a frame of two rolls, or one roll if strike
  class Frame
    attr_reader :first_roll, :second_roll, :spare_bonus, :strike_bonus

    def value
      first_roll.to_i + second_roll.to_i + spare_bonus.to_i + strike_bonus.to_i
    end

    def add_roll(pins)
      if first_roll.nil?
        @first_roll = pins
      else
        raise BowlingError if first_roll + pins > 10
        @second_roll = pins
      end
    end

    def add_bonus_pins(pins)
      if spare_bonus.nil?
        @spare_bonus = pins
      else
        raise BowlingError if spare_bonus < 10 && spare_bonus + pins > 10
        @strike_bonus = pins
      end
    end

    def strike?
      first_roll == 10
    end

    def spare?
      !strike? && done? && first_roll + second_roll == 10
    end

    def done?
      strike? || !first_roll.nil? && !second_roll.nil?
    end

    def needs_bonus?
      need_spare_bonus? || need_strike_bonus?
    end

    def need_spare_bonus?
      spare? && spare_bonus.nil?
    end

    def need_strike_bonus?
      strike? && (strike_bonus.nil? || spare_bonus.nil?)
    end
  end
end

module BookKeeping
  VERSION = 3
end
