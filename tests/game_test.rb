require_relative '../game'
require 'test/unit'

class GameTest < Test::Unit::TestCase
  def test_valid?
    game = Game.new
    guess = %w[red blue green yellow]
    expected = true
    assert_equal(expected, game.valid?(guess))
    guess = %w[red red]
    expected = false
    assert_equal(expected, game.valid?(guess))
    guess = %w[purple red red red]
    expected = false
    assert_equal(expected, game.valid?(guess))
  end

  def test_feedback
    game = Game.new(%w[red blue blue red])
    guess = %w[red blue green yellow]
    expected = %w[black black]
    assert_equal(expected, game.feedback(guess))
    guess = %w[red blue red yellow]
    expected = %w[black black white]
    assert_equal(expected, game.feedback(guess))
    guess = %w[red red red red]
    expected = %w[black black]
    assert_equal(expected, game.feedback(guess))
    guess = %w[blue red red blue]
    expected = %w[white white white white]
    assert_equal(expected, game.feedback(guess))
    guess = %w[red red yellow yellow]
    expected = %w[black white]
    assert_equal(expected, game.feedback(guess))
  end
end
