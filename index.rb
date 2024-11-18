require_relative 'game'

game = Game.new

(1..12).each do |_i|
  guess = game.take_input
  game.feedback(guess)
  if game.win?
    puts 'Congratulations, you won!'
    break
  end
end
puts 'Sorry, you lost!' unless game.win?
