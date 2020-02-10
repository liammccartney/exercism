module Hamming

  def self.compute(a, b)
    if a.length != b.length
      raise ArgumentError
    end

    (0...a.length).count {|i| a[i] != b[i]}
  end
end
