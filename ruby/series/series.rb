class Series
  attr_reader :digits

  def initialize digits
    @digits = digits
  end

  def slices series_length
    if series_length > @digits.length
      raise ArgumentError
    end

    (0...@digits.length).reduce([]) do |series, idx|
      slice = @digits.slice(idx, series_length)
      if slice.length == series_length
        series << slice
      else
        series
      end
    end
  end
end
