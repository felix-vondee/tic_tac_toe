class Board
    def initialize
        @board = Array.new(9, ' ')
    end

    def display
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def display_turn(player)
        puts "it's #{@current_player}'s turn!"
    end

    def position_taken?(position)
        @board[position] == 'X' || @board[position] == 'O'
    end

    def size
        @board.length
    end

    def add(symbol, position)
        @board[position] = symbol
    end

    def get_data
        @board
    end

end