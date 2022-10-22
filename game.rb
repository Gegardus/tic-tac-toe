require_relative 'board'

class Game 
    def initialize(players)
    @players = players
    @board = Board.new
   end

   def play_until_end 
    current_player, other_player = @players
    until @wiinner do      
      play_turn(current_player)      
      current_player, other_player = other_player, current_player
    end
    puts @board.display
    @wiinner
   end

   def play_turn(player)
    puts @board.display
    puts "It's #{player.name}'s turn."
    move = player.get_move
    @board[*move] = (player.marker)  
    @wiinner = player if @board.wiinner?(player)    
   end  
end