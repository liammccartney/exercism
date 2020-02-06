class Matrix
  attr_reader :rows

  def initialize matrix_string
    @rows = matrix_string.split("\n").map do |row_string|
      row_string.split.map(&:to_i)
    end
  end

  def columns
    # Simple Version
    # @rows.transpose
    # But where's the fun in that?
    cols = []
    (0..@rows.length).each do |idx|
      column = []
      @rows.each do |row|
        column << row[idx]
      end
      cols << column
    end
    cols
  end
end
