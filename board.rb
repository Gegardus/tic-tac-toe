class Board
  WIDTH = 3
  HEIGHT = WIDTH
  
  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ") }
  end

  def display  
    @grid.reduce("\n") { |output, row| output << format_row(row) } << "\n"    
  end  

  def wiinner?(marker) 
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker) 
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

  private

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

  def format_row(row)
    row.reduce("") { |row_string, cell| row_string << "[ #{cell} ]" } << "\n"
  end
end
