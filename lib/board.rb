class Board
  def initialize
    @board = Array.new(9, ' ')
  end

  def display
    " #{@board[0]} | #{@board[1]} | #{@board[2]}\n"\
    " #{@board[3]} | #{@board[4]} | #{@board[5]}\n"\
    " #{@board[6]} | #{@board[7]} | #{@board[8]}"\
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

  def receive_data
    @board
  end
end
