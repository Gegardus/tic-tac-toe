require_relative 'game'
require_relative 'player'

class Session

  def initialize     
    @players = [
      Player.new('Vahan', :X),
      Player.new('Ani', :O)
    ]    
    @ties = 0    
    play_loop   
  end

  private

  def play_loop 
    puts "Welcome to Tic Tac Toe!"
    loop do 
      puts "Starting a new game."  
      game = Game.new(@players)
      puts update_scores(game.winner)
      puts display_scores
      break unless play_again?    
    end
    puts "Goodbye!"
  end

  def play_again? 
    print "Play again? (y/n)\n> "
    loop do
      answer = gets.strip[0].upcase
      case answer
      when "Y" 
        return true
      when "N"
        return false
      else
        print "What was that? (type 'y' or 'n')\n> "
      end
    end
  end

  def update_scores(winner) 
    if winner      
      winner.increment_score
      "#{ winner.name } won!"
    else
      @ties += 1
      puts "The game was a tie!"     
    end
  end

  def display_scores 
    scores_array = 
      ["", "The scores after #{games_played} games :"]
    scores_array.concat(
    @players.map {|player| "#{player.name} has won #{player.score} times"}
  )
    scores_array << 
      "#{@players[0].name} and #{@players[1].name} have tied #{@ties} times"
    scores_array << 
      ""
  end

  def games_played 
    @ties + @players.reduce(0) {|a, e| a + e.score }
  end
end