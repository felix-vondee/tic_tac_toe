#!/usr/bin/env ruby

class TicTacToe
    def initialize
      @board = Array.new(9, " ")
      self.get_names
        self.set_current_player
        self.game_loop
    end

    def game_loop
        loop do
            self.display_board
            self.choose_position
            self.set_current_player
        end
    end

    def display_board
    puts "it's #{@current_player}'s turn!}"
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def make_move(position)
        @board[position] = 'X' if @current_player == @player_1
        @board[position] = 'O' if @current_player == @player_2
    end

    def choose_position
        puts 'Choose position to add your symbol to : 1-9'
        choice = gets.chomp.to_i-1
        if self.valid_move?(choice)
            make_move(choice)
        else
            puts 'Invalid move. Try again!'
            self.choose_position
        end
    end

    def set_current_player
        if @current_player == @player_1
            @current_player = @player_2
        elsif @current_player == @player_2
            @current_player = @player_1
        else
            @current_player = [@player_1, @player_2].sample
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

    def valid_move?(int)
     !position_taken?(int) && @board[int] == " "
    end

end

TicTacToe.new
