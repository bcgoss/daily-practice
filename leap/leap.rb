class Year
  def self.leap? (year)
    Year.new(year).leap
  end
  def initialize year
    @year = year
  end

  def leap
    multiple_of?(400) || multiple_of?(4) && not(multiple_of?(100))
  end

  def multiple_of?(number)
    @year % number == 0
  end
end
module BookKeeping
  VERSION = 3
end
