class Player
  def initialize
    @score = 0
  end

  def scores
    @score += 1
  end

  attr_reader :score
end

