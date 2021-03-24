require_relative '../lib/board'

# rubocop: disable Style/MultipleComparison

class Game
  attr_reader :current_player

  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                          [0, 3, 6], [1, 4, 7], [2, 5, 8],
                          [0, 4, 8], [2, 4, 6]].freeze

  def initialize(player_a, player_b)
    @board = Board.new
    @player_a = player_a
    @player_b = player_b
  end

  def start
    assign_players
    game_loop
  end

  def display_turn
    "it's #{@current_player.name}'s turn!"
  end

  def turn_count
    count = 0
    @board.receive_data.each { |e| count += 1 if %w[X O].include?(e) }
    count
  end

  def set_current_player
    @current_player = if @current_player == @player_a
                        @player_b
                      elsif @current_player == @player_b
                        @player_a
                      else
                        [@player_a, @player_b].sample
                      end
  end

  def determine_winner
    actual_array = []
    WINNING_COMBINATIONS.flatten.each do |i|
      actual_array << @board.receive_data[i]
    end
    actual_array = actual_array.each_slice(3).to_a
    actual_array.each do |el|
      return @current_player if el == %w[X X X] || el == %w[O O O]
    end
    nil
  end

  def game_over(winner)
    if winner
      "'#{winner.name}' is the Winner!"
    else
      'It\'s a DRAW'
    end
  end

  def assign_players
    @player_a = Player.new(input_names('X'))
    @player_b = Player.new(input_names('O'))
  end

  def make_move(position)
    @board.add('X', position) if @current_player == @player_a
    @board.add('O', position) if @current_player == @player_b
  end

  def valid_move?(int)
    !@board.position_taken?(int) && int < @board.size
  end

  def display_board
    @board.display
  end
end

# rubocop: enable Style/MultipleComparison
