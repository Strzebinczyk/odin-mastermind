require_relative 'game'

game = Game.new
puts 'Colors to choose from are red, blue, green, orange, yellow and brown'
puts 'please enter colors separated by a comma (,) and a space'
(1..12).each do |_i|
  guess = game.take_input
  if game.win?(guess)
    puts 'Congratulations, you won!'
    break
  end
  puts game.feedback(guess).join(' ')
end
puts 'Sorry, you lost!' unless game.won
