# Convert age in seconds to years on various planets
class SpaceAge
  EARTH_YEAR_SECONDS = 31_557_600.0
  PERIODS = { earth: 1,
              mercury: 0.2408467,
              venus: 0.61519726,
              mars: 1.8808158,
              jupiter: 11.862615,
              saturn: 29.447498,
              uranus: 84.016846,
              neptune: 164.79132 }.freeze

  def initialize(seconds)
    @seconds = seconds
  end

  PERIODS.each do |planet, ratio|
    define_method(:"on_#{planet}") { @seconds / (EARTH_YEAR_SECONDS * ratio) }
  end
end

module BookKeeping
  VERSION = 1
end
