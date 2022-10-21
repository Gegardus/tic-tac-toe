require_relative 'board'

class Game 
    def initialize(players)
    @players = players
    @board = Board.new
   end

   def play_turn(player)

     # Get a move from player one
     move = player.get_move

     # Mark that place on the board
     @board[*move] = (player.marker)
     
     # Check for a winner
     @board.wiinner?(player.marker)
   end

   def display_board 
    @board.display
   end
end