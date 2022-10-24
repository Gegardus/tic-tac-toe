class Board
  WIDTH = 3
  HEIGHT = WIDTH
  STABBY = [
    -> (i) { i },
    -> (i) { -(i + 1) }
  ]
  
  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ") }
  end

  def winner?(player)
    marker = player.marker
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker)    
  end

  def spaces_left? 
    @grid.any? do |row| 
      row.any? do |cell| 
        cell = :" "
      end
    end
  end

  def place_marker(coordinates, marker) 
    y, x = coordinates
    @grid[y][x] = marker if @grid[y][x] == :" "   
  end

  def display  
    output = "\n"
    output << generate_header
    output << generate_rows
    output << "\n"  
  end  

  private

  def format_row(row, letter)
    row.reduce("  #{letter} ") { |string, cell| string << "[#{cell}]" } << "\n"
  end

  def generate_header
    (1..WIDTH).reduce("   ") { |header, n| header << "  #{n}" } << "\n"
  end

  def generate_rows
    letter = "@"    
    @grid.reduce("") do |output, row| 
      letter = letter.next
      output << format_row(row, letter)        
    end     
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
    STABBY.any? do |match_to_column|
      (0...HEIGHT).all? do |row_index|
        @grid[row_index] [match_to_column.call(row_index)] == marker
      end
    end
  end

  # def diagonal_win?(marker) 
  #   (0...WIDTH).any? do |column|
  #     @grid.all? do |row|
  #       row[column] == marker
  #       column += 1
  #     end
  #   end
  # end
end
