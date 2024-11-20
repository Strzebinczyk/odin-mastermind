# require_relative '../game'
require_relative '../computer'
require 'test/unit'

class ComputerTest < Test::Unit::TestCase
  def test_guess
    # First iteration
    computer = Computer.new
    feedback = []
    expected = %w[red red red red]
    assert_equal(expected, computer.guess(feedback))
    # Second iteration
    feedback = []
    expected = %w[blue blue blue blue]
    assert_equal(expected, computer.guess(feedback))
    # third iteration
    feedback = %w[black white]
    expected = %w[blue blue green green]
    assert_equal(expected, computer.guess(feedback))
    # Fourth iteration
    feedback = %w[black white, white]
    expected = %w[blue blue green orange]
    assert_equal(expected, computer.guess(feedback))
  end
end
