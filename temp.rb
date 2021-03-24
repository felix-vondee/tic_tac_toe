board = ['X', 'O', 'X', ' ', 'O', 'X','X', 'O', ' ']
  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]].freeze
actual_array = []
WINNING_COMBINATIONS.flatten.each do |i|
  actual_array << board[i]
end
actual_array = actual_array.each_slice(3).to_a
WINNING_COMBINATIONS.each { |el| return @current_player if el == ['X', 'X', 'X'] || el == ['O', 'O', 'O']}

p actual_array