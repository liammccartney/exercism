class Game
  attr_reader :frames

  def initialize
    @rolls = []
    @frames = []
    @prev_frame = Frame.new
  end

  def roll(pins)
    raise BowlingError, 'Cannot roll less than 0 pins' if pins.negative?
    raise BowlingError, 'Cannot roll more than 10 pins at a time' if pins > 10
    raise BowlingError, 'Cannot roll more than 10 frames' if game_complete?

    @rolls << pins

    @prev_frame.add_roll(pins)

    if @prev_frame.complete?
      @frames << @prev_frame
      if @frames.length == 9
        @prev_frame = FinalFrame.new
      else
        @prev_frame = Frame.new
      end
    end
  end

  def score
    raise BowlingError, 'Cannot score an empty game' if @rolls.empty?
    raise BowlingError, 'Cannot score an incomplete game' unless game_complete?

    calculate_score @rolls
  end

  private

  def game_complete?
    @frames.length == 10 && @frames.last.complete?
  end

  def calculate_score(pins)
    return 0 if pins.empty?

    return pins.first if pins.length == 1

    roll1, roll2, roll3 = pins[0, 3]

    # Last Frame
    return roll1 + roll2 + roll3 if pins.length == 3

    return roll1 + roll2 + roll3 + (calculate_score pins[1..-1]) if strike?(roll1)

    return roll1 + roll2 + roll3 + (calculate_score pins[2..-1]) if spare?(roll1, roll2)

    roll1 + roll2 + (calculate_score pins[2..-1])
  end

  def strike?(roll)
    roll == 10
  end

  def spare?(roll1, roll2)
    roll1 + roll2 == 10
  end

  class BowlingError < StandardError
  end

  class Frame
    def initialize
      @rolls = []
      @viable_pins_for_next_roll = (0..10)
    end

    def add_roll(pins)
      unless @viable_pins_for_next_roll.include?(pins)
        raise BowlingError, 'Roll not possible'
      end

      @rolls << pins
      @viable_pins_for_next_roll = (0..10 - pins)
    end

    def score
      @rolls.sum
    end

    def complete?
      @rolls.length == 2 || score == 10
    end
  end

  class FinalFrame < Frame
    def initialize
      @rolls = []
      @viable_pins_for_next_roll = (0..10)
    end

    def add_roll(pins)
      unless @viable_pins_for_next_roll.include?(pins)
        raise BowlingError, 'Roll not possible'
      end

      @rolls << pins

      if complete? || pins == 10 || @rolls.sum == 10
        @viable_pins_for_next_roll = (0..10)
      else
        @viable_pins_for_next_roll = (0..10 - pins)
      end
    end

    def complete?
      (@rolls.length == 2 && @rolls.sum < 10) || @rolls.length == 3
    end
  end
end
