require_relative 'game'

class Game
  attr_reader :won, :code

  def initialize(code = nil)
    @colors = %w[red blue green orange yellow brown]
    @code = code || 4.times.map { @colors.sample }
    @won = false
  end

  def take_input
    puts 'Please enter your guess'
    guess = gets.chomp.downcase
    until valid?(guess)
      puts 'Please enter a valid guess'
      guess = gets.chomp.downcase
    end
    guess
  end

  def process_guess(guess)
    guess.split(', ')
  end

  def valid?(guess)
    guess = process_guess(guess)
    guess.all? { |element| @colors.include?(element) } && guess.length == 4
  end

  def feedback(guess)
    result = []
    guess = process_guess(guess)
    code = @code.dup
    guess.each_with_index do |color, index|
      if color == code[index]
        result.push('black')
        code[index] = nil
      else
        result.push(nil)
      end
    end
    guess.each_with_index do |color, index|
      if code.include?(color) && color != @code[index]
        result[index] = 'white'
        code[code.index(color)] = nil
      end
    end
    result.compact.sort
  end

  def win?(guess)
    return false unless process_guess(guess) == @code

    @won = true
    true
  end
end
