require_relative 'game'
require_relative 'player'

players = [
   Player.new('Vahan', :X),
   Player.new('Ani', :O)
]

game = Game.new(players)

puts "Welcome to Tic Tac Toe!"

winner = game.play_until_end

puts "#{ winner.name } won!"


