class Game
  def initialize
    @rolls = []
    @last_frame = []
  end

  def roll pins
    if !standard_rolls_complete?
      raise BowlingError if (@last_frame + [pins]).sum > 10
    end

    raise BowlingError if pins < 0 || pins > 10

    @rolls << pins
    @last_frame << pins

    if @last_frame.length == 2
      @last_frame = []
    end

  end

  def score
    calculate_score @rolls
  end

  private

  def standard_rolls_complete?
    @rolls.length == 20
  end

  def calculate_score pins
    return 0 if pins.empty?

    return pins.first if pins.length == 1

    roll1, roll2, roll3 = pins[0,3]

    if pins.length == 3
      return roll1 + roll2 + roll3 + (calculate_score pins[3..])
    end

    return roll1 + roll2 + roll3 + (calculate_score pins[1..]) if (pins.first == 10)

    return roll1 + roll2 + roll3 + (calculate_score pins[2..]) if is_spare?(roll1, roll2)

    return roll1 + roll2 + (calculate_score pins[2..])
  end

  def is_strike?(roll)
    roll == 10
  end

  def is_spare?(roll1, roll2)
    roll1 + roll2 == 10
  end

  class BowlingError < StandardError
  end

  class Frame
  end
end
