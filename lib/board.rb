class board
    def initialize
        @board = Array.new(9, ' ')
    end

    def display
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

end