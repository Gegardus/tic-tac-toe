class Player 
    ROW_MAP = (:A..:C).zip(0..2).to_h
    TRANSALTIONS = {
      row: -> (input) { ROW_MAP[input[0].upcase.to_sym] },
      column: -> (input) { input.to_i - 1 }
    }
    attr_reader :marker
    attr_reader :name

    def initialize(name, marker)
      @name = name
      @marker = marker
      @score = 0
    end

    def get_move  
      TRANSALTIONS.map do |row_or_column, translator| 
        get_coordinate(row_or_column, translator) 
      end
    end

    private

    def get_coordinate(row_or_column, translator) 
    loop do
      print prompt_choice(row_or_column)
      input = gets
      choice = translator.call(input)
      return choice if in_bounds?(choice) 
      puts "Invalid #{ row_or_column }."
    end 
   end

   def prompt_choice(row_or_column) 
      "Pick a #{row_or_column}\n"
    end

    def in_bounds?(choice) 
      (0..2).include?(choice)
    end
end 