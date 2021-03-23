#!/usr/bin/env ruby

class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
    input_names
    set_current_player
    game_loop
  end

  def game_loop
    loop do
      display_board
      choose_position
      set_current_player
    end
  end

  def display_board
    puts "it's #{@current_player}'s turn!}"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def make_move(position)
    @board[position] = 'X' if @current_player == @player_a
    @board[position] = 'O' if @current_player == @player_b
  end

  def choose_position
    puts 'Choose position to add your symbol to : 1-9'
    choice = gets.chomp.to_i - 1
    if valid_move?(choice)
      make_move(choice)
    else
      puts 'Invalid move. Try again!'
      choose_position
    end
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

  def input_names
    puts 'Enter your name for player 1 (X) '
    @player_a = gets.chomp

    puts 'Enter your name for player 2 (O)'
    @player_b = gets.chomp
  end

  def position_taken?(position)
    @board[position] == 'X' || @board[position] == 'O'
  end

  def valid_move?(int)
    !position_taken?(int) && @board[int] == ' '
  end
end

TicTacToe.new
