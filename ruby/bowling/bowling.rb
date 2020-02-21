class Game
  def initialize
    @rolls = []
  end

  def roll pins
    if @rolls.length.odd?
      last_roll = @rolls.last || 0
        raise BowlingError if last_roll != 10 && (pins + last_roll) > 10
    end

    if pins < 0 ||
        pins > 10
      raise BowlingError
    end
    @rolls << pins
  end

  def score
    calculate_score @rolls
  end

  private

  def calculate_score pins
    return 0 if pins.empty?

    return pins[0] if pins.length == 1

    if pins.length == 3
      roll1, roll2, roll3 = pins.slice(0,3)
      return roll1 + roll2 + roll3 + (calculate_score pins.slice(3..))
    end

    return pins.first + pins[1] + pins[2] + (calculate_score pins.slice(1..)) if (pins.first == 10)

    roll1, roll2 = pins.slice(0,2)

    return roll1 + roll2 + pins[2] + (calculate_score pins.slice(2..)) if roll1 + roll2 == 10

    return roll1 + roll2 + (calculate_score pins.slice(2..))
  end

  class BowlingError < StandardError
  end
end
