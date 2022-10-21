class Board
  WIDTH = 3
  HEIGHT = WIDTH
  
  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ") }
  end

  def print_grid    
    @grid.each do |row|
      puts
      row.each do |cell|
        print "[ #{cell} ]"  
      end       
    end  
     puts    
  end  

  def wiinner?(marker) 
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker) 
  end

  def row_win?(marker)
    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end      
  end 

  def column_win?(marker) 
    (0...WIDTH).any? do |column|
      @grid.all? do |row|
        row[column] == marker
      end
    end
  end

  def diagonal_win?(marker) 
    (0...WIDTH).any? do |column|
      @grid.all? do |row|
        row[column] == marker
        column += 1
      end
    end
  end

  def [](y, x) 
    @grid[y][x]
  end

  def []=(y, x, marker) 
    if @grid[y][x] == :" " && [:X, :O].include?(marker)
      @grid[y][x] = marker
    else 
      false
    end
  end
end

# def check_and_print 
#  @b.print_grid
#  puts
#  p @b.row_win(:X)
#  p @b.row_win(:O)
#  p @b.column_win(:X)
#  p @b.column_win(:O)
#  p @b.diagonal_win(:X)
#  p @b.diagonal_win(:O)
# end

# @b = Board.new
# @b[0, 2] = :O
# check_and_print 
# @b[1, 1] = :O
# check_and_print
# @b[2, 0] = :O
# check_and_print