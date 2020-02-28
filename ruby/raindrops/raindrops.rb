module Raindrops
  extend self

  def convert(number)
    result = {
      3 => "Pling",
      5 => "Plang",
      7 => "Plong"
    }.reduce("") do |str, (factor, raindrop)|
      if number % factor == 0
        str += raindrop
      else
        str
      end
    end
    result.empty? ? number.to_s : result
  end
end
