require_relative 'board'

class Game 

  attr_reader :winner
  
    def initialize(players)
    @players = players
    @board = Board.new
    play_until_end
   end

   def play_until_end 
    current_player, other_player = @players
    until @wiinner || !@board.spaces_left? do      
      play_turn(current_player)      
      current_player, other_player = other_player, current_player      
    end
    puts @board.display
    @wiinner
   end

   def play_turn(player)
    puts @board.display
    puts "It's #{player.name}'s turn."
    loop do
      target_cell = player.get_move
      break if @board.place_marker(target_cell, player.marker)  
      puts "Invalid move."
    end  
    @wiinner = player if @board.wiinner?(player)    
   end  
end
