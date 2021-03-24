require_relative '../lib/board'

# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

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
    puts "it's #{@current_player.name}'s turn!"
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
        if el == ['X', 'X', 'X'] || el == ['O', 'O', 'O']
         return @current_player
        end
      end
      nil
  end

  def draw
    puts 'It\'s a DRAW'
  end

  def game_over(winner)
    puts 'GAME OVER!'
    @board.display
    if winner
      puts "'#{winner.name}' is the Winner!"
    else
      draw
    end
    exit
  end

  def assign_players
    @player_a = Player.new(input_names('X'))
    @player_b = Player.new(input_names('O'))
  end

  def make_move(position)
    @board.add('X', position) if @current_player == @player_a
    @board.add('O', position) if @current_player == @player_b
    game_over(determine_winner) if determine_winner
  end

  def valid_move?(int)
    !@board.position_taken?(int) && int < @board.size
  end

  def display_board
    @board.display
  end
end

# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
