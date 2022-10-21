require_relative 'game'
require_relative 'player'

players = [
   Player.new('Vahan', :X),
   Player.new('Ani', :O)
]

game = Game.new(players)

puts "Welcome to Tic Tac Toe!"
puts "Player's one turn."
puts game.display_board
puts  'Player one, pick a move:'
p game.play_turn(players[0])
puts game.display_board