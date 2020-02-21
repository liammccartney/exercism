class Game
  attr_reader :frames
  def initialize
    @frames = []
  end

  def roll pins
    if @frames.empty?
      @frames << [pins]
    elsif last_frame_incomplete?
      if pins + last_frame.sum > 10
        raise BowlingError
      end
      @frames = @frames.take(@frames.length - 1) << (last_frame << pins)
    else
      @frames << [pins]
    end

  end

  def score
    sum = 0
    @frames.each_with_index do |frame, idx|
      prevFrame = @frames[idx - 1]
      nextFrame = @frames[idx + 1]
      if is_spare?(frame)
        sum += frame.sum + nextFrame.sum
      sum += frame.sum
    end
    sum
  end

  private

  def is_spare? frame
    frame.length == 2 && frame.sum == 10
  end

  def last_frame_incomplete?
    last_frame.sum < 10 && last_frame.length < 2
  end

  def last_frame
    @frames.last || []
  end

  class BowlingError < StandardError
  end
end

game = Game.new
rolls = [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
rolls.each { |pins| game.roll(pins) }
