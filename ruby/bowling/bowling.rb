class Game
  attr_reader :frames
  def initialize
    @last_frame = Frame.new
    @frames = []
    @extra_rolls = []
  end

  def roll pins
    if @frames.length == 10
      @extra_rolls << pins
    else
      @last_frame.add_roll(pins)

      if @last_frame.is_complete?
        @frames << @last_frame
        @last_frame = Frame.new
      end
    end
  end

  def score
    sum = 0
    @frames.each_with_index do |frame, index|
      sum += frame.score

      if frame.is_strike?
        next_frame = @frames[index + 1]

        if next_frame
          if next_frame.is_strike?
            next_next_frame = @frames[index + 2]
            if next_next_frame
              sum += next_frame.score
            end
          end
        end

      elsif frame.is_spare?
        next_frame = @frames[index + 1]
        if next_frame
           sum += next_frame.first_roll
        end
      end

    end
    sum += @extra_rolls.sum
  end


  class BowlingError < StandardError
  end

  private

  class Frame
    def initialize
      @rolls = []
    end

    def add_roll(roll)
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

game = Game.new
rolls = [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
rolls.each { |pins| game.roll(pins) }
# puts game.frames
