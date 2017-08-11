# A 24 hour clock with hours and minutes
class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24

  def self.at(*args)
    new(*args)
  end

  def initialize(hour = 0, min = 0)
    @total_minutes = hour * MINUTES_PER_HOUR + min
  end

  def to_s
    format '%02i:%02i', *time
  end

  # rubocop:disable Style/OptionalArguments for consistency with initialize
  def +(hour = 0, min)
    @total_minutes += hour * MINUTES_PER_HOUR + min
    self
  end
  # rubocop:enable Style/OptionalArguments

  def ==(other)
    to_s == other.to_s
  end

  private

  def time
    [clock_hours(@total_minutes), clock_minutes(@total_minutes)]
  end

  def clock_hours(minutes)
    minutes / MINUTES_PER_HOUR % HOURS_PER_DAY
  end

  def clock_minutes(minutes)
    minutes % MINUTES_PER_HOUR
  end
end

module BookKeeping
  VERSION = 2
end
