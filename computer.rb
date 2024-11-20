class Computer
  def initialize
    @colors = %w[red blue green orange yellow brown]
    @last_guess = []
    @guesses = []
  end

  def guess(feedback)
    if !@colors.empty? && feedback.empty?
      color = @colors.shift
      guess = [color, color, color, color]
      @guesses.push(guess)
      @last_guess = guess
      guess
    elsif !@colors.empty? && feedback.length < 4
      color = @colors.shift
      guess = @last_guess[0..feedback.length - 1]
      guess.push(color) while guess.length < 4
      @guesses.push(guess)
      @last_guess = guess
      guess
    elsif feedback.length == 4
      loop do
        guess = @last_guess.sample(4)
        break unless @guesses.include?(guess)
      end
      @guesses.push(guess)
      @last_guess = guess
      guess
    end
  end
end
