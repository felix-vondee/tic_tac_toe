#!/usr/bin/env ruby

class TicTacToe
  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                          [0, 3, 6], [1, 4, 7], [2, 5, 8],
                          [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @board = Array.new(9, ' ')
    assign_players
    game_loop
  end

  def game_loop
    loop do
        set_current_player
        display_turn
        display_board
        choose_position
        game_over(nil) if turn_count >= 9
      end
  end

  def game_over(winner)
    puts 'GAME OVER!'
    display_board
    if winner
      puts "'#{winner}' is the Winner!"
    else
      draw
    end
    exit
  end

  def display_turn
    puts "it's #{@current_player}'s turn!"
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def make_move(position)
    @board[position] = 'X' if @current_player == @player_a
    @board[position] = 'O' if @current_player == @player_b
    if determine_winner
      game_over(determine_winner)
    end
  end

  def choose_position
    puts "#{@current_player}, choose position to add your symbol to : 1-9"
    choice = gets.chomp.to_i - 1
    if choice >= 0 && valid_move?(choice)
      make_move(choice)
    else
      puts 'Invalid move. Try again!'
      choose_position
    end
  end

  def turn_count
    count = 0
    @board.each { |e| count += 1 if %w[X O].include?(e) }
    count
  end

  def determine_winner
    if @current_player == @player_a
      x = []
      @board.each_with_index { |el, index| x << index if el == 'X' }
      WINNING_COMBINATIONS.each do |i|
        return @current_player if i == x
      end
    elsif @current_player == @player_b
      o = []
      @board.each_with_index { |el, index| o << index if el == 'O' }
      WINNING_COMBINATIONS.each do |i|
        return @current_player if i == o
      end
    end
    nil
  end

  def draw
    puts 'It\'s a DRAW'
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

  def assign_players
    @player_a = input_names('X')
    @player_b = input_names('O')
  end

  def input_names(player)
    puts "Enter your name for player #{player} "
    input = gets.chomp
    input_names(player) if input.empty? # restart the method if input is empty
    input
  end

  def position_taken?(position)
    @board[position] == 'X' || @board[position] == 'O'
  end

  def valid_move?(int)
    !position_taken?(int) && int < @board.length
  end
end

TicTacToe.new
