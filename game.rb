class Game
  attr_reader :won, :code

  def initialize(code = nil)
    @colors = %w[red blue green orange yellow brown]
    @code = code || 4.times.map { @colors.sample }
    @won = false
  end

  def take_choice
    puts 'Please choose if you want to guess or create the code.'
    puts 'Write \'guess\' or \'create\''
    choice = gets.chomp.downcase
    until %w[guess create].include?(choice)
      puts 'Please enter a valid choice'
      choice = gets.chomp.downcase
    end
    choice
  end

  def take_code
    puts 'Please enter a code'
    code = gets.chomp.downcase
    code = code.split(', ')
    until valid?(code)
      puts 'Please enter a valid code'
      code = gets.chomp.downcase
      code = code.split(', ')
    end
    code
  end

  def valid?(guess)
    guess.all? { |element| @colors.include?(element) } && guess.length == 4
  end

  def feedback(guess)
    result = []
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
    return false unless guess == @code

    @won = true
    true
  end
end
