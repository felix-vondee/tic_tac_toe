#!/usr/bin/env ruby

class TicTacToe
    def initialize
      @board = Array.new(9, " ")
      # self.get_names
    end

    def game_loop
    end

    def display_board
    puts "it's #{@current_player}'s turn!}"
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def set_current_player
        if @current_player == @player_1
            @current_player == @player_2
        elsif @current_player == @player_2
            @current_player == @player_1
        else
            @current_player = [@player_1, @player_2]
        end
    end

    def get_names
      puts "Enter your name for player 1 (X) "
      @player_1 = gets.chomp 

      puts "Enter your name for player 2 (O)"
      @player_2 = gets.chomp 

    end

    def position_taken?(position)
     @board[position] == "X" || @board[position] == "O"
    end

    def valid_move?(position)
     !position_taken?(position) && @board[position] == " "
    end

end

TicTacToe.new
