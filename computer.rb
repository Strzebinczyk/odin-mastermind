class Computer
  def initialize
    @colors = %w[red blue green orange yellow brown]
    @last_guess = []
    @guesses = []
  end

  # @param [Array<String>] feedback eg. %w[black black white]
  # @return [Array<String>] eg. %w[red blue green yellow]
  def guess(feedback)
    # Starting guesses should be arrays of four strings of the same color
    if !@colors.empty? && feedback.empty?
      color = @colors.shift
      guess = [color, color, color, color]
      @guesses.push(guess)
      @last_guess = guess
      guess
    # When computer starts getting feedback that means it has hit the correct color
    # Correct colors should be left in the guess array from the @last_guess
    elsif !@colors.empty? && feedback.length < 4
      color = @colors.shift
      guess = @last_guess[0..feedback.length - 1]
      guess.push(color) while guess.length < 4
      @guesses.push(guess)
      @last_guess = guess
      guess
    # When feedback array has four strings that means computer has all of the correct colors
    # Guess should be a random placement of each color in an array
    elsif feedback.length == 4
      loop do
        guess = @last_guess.sample(4)
        # Guesses should not repeat
        break unless @guesses.include?(guess)
      end
      @guesses.push(guess)
      @last_guess = guess
      guess
    end
  end
end
