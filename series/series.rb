class Series
  def initialize(series)
    @series = series.chars
  end

  def slices(size)
    raise SizeError, 'Slice is larger than the series' if size > @series.size
    slices_of(size).times.map { |start| @series.slice(start, size).join }
  end

  private 

  def slices_of(size)
    @series.size - (size - 1)
  end

  SizeError = Class.new(ArgumentError)
end
