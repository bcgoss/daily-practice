# A 24 hour clock with hours and minutes
class Clock
  attr_reader :hour, :minute
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24

  def self.at(hour, minute)
    new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = (hour + minute / MINUTES_PER_HOUR) % HOURS_PER_DAY
    @minute = minute % MINUTES_PER_HOUR
  end

  def to_s
    hour.to_s.rjust(2, '0') + ':' + minute.to_s.rjust(2, '0')
  end

  def +(other)
    Clock.at(hour, minute + other)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end
end

module BookKeeping
  VERSION = 2
end
