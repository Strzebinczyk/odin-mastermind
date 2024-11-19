require_relative '../game'
require 'test/unit'

class GameTest < Test::Unit::TestCase
  def test_process_guess
    game = Game.new
    guess = 'red, blue, green, yellow'
    expected = %w[red blue green yellow]
    assert_equal(expected, game.process_guess(guess))
  end

  def test_valid?
    game = Game.new
    guess = 'red, blue, green, yellow'
    expected = true
    assert_equal(expected, game.valid?(guess))
    guess = 'red, red'
    expected = false
    assert_equal(expected, game.valid?(guess))
    guess = 'purple, red, red, red'
    expected = false
    assert_equal(expected, game.valid?(guess))
  end

  def test_feedback
    game = Game.new(%w[red blue blue red])
    guess = 'red, blue, green, yellow'
    expected = %w[black black]
    assert_equal(expected, game.feedback(guess))
    guess = 'red, blue, red, yellow'
    expected = %w[black black white]
    assert_equal(expected, game.feedback(guess))
    guess = 'red, red, red, red'
    expected = %w[black black]
    assert_equal(expected, game.feedback(guess))
    guess = 'blue, red, red, blue'
    expected = %w[white white white white]
    assert_equal(expected, game.feedback(guess))
    guess = 'red, red, yellow, yellow'
    expected = %w[black white]
    assert_equal(expected, game.feedback(guess))
  end
end
