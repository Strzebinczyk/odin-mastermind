require_relative 'game'

class Game
  def initialize
    @code = Code.new
    @code.select
  end

  def take_input
  end

  def valid?
  end

  def feedback
  end

  def win?
  end

  def play_round
  end
end
