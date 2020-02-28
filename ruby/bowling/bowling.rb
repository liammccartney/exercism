class Game
  def initialize
    @rolls = []
    @frames = []
    @last_frame = Frame.new
  end

  def roll pins
    raise BowlingError if pins < 0 || pins > 10

    @rolls << pins

    @last_frame.add_roll(pins)
    if @last_frame.is_complete?
      @frames << @last_frame
      @last_frame = Frame.new
    end
  end

  def score
    raise BowlingError if @rolls.empty?
    calculate_score @rolls
  end

  private

  def standard_rolls_complete?
    @frames.length == 10
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
    def initialize
      @rolls = []
    end

    def add_roll(roll)
      raise BowlingError if (@rolls + [roll]).sum > 10
      @rolls << roll
    end

    def first_roll
      @rolls.first
    end

    def score
      @rolls.sum
    end

    def is_complete?
      @rolls.length == 2 || score == 10
    end

    def is_spare?
      score == 10 && is_complete?
    end

    def is_strike?
      score == 10 && @rolls.length == 1
    end

    def to_s
      @rolls.to_s
    end
  end
end
