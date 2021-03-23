#!/usr/bin/env ruby

class TicTacToe
    def initialize
      @turns = 0
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      assign_players
      set_current_player
      display_board
      game_loop
    end
  
    def game_loop
      game_on = true
      while game_on
        puts "it's #{@current_player}'s turn!"
        choose_position
        set_current_player
        @turns += 1
        if winner
          draw
          game_on = false
        end
      end
    end
  
    def winner
      @turns == 3
    end
  
    def draw
      puts 'Game Over!'
      puts 'DRAW!'
    end
  
    def win
      puts 'Game Over!'
      puts "WIN! #{@current_player} won the game!"
    end
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end
  
    def make_move(position)
      @board[position] = 'X' if @current_player == @player_a
      @board[position] = 'O' if @current_player == @player_b
    end
  
    def choose_position
      puts "#{@current_player} Choose position to add your symbol to : 1-9"
      choice = gets.chomp
      choose_position if choice.empty? # restart the method if input is empty
      choice = choice.to_i - 1
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
  
    def assign_players
      @player_a = input_names('X')
      @player_b = input_names('O')
    end
  
    def input_names(player)
      puts "Enter name for player #{player} "
      input = gets.chomp
      input_names(player) if input.empty? # restart the method if input is empty
      input
    end
  
    def position_taken?(position)
      @board[position] == 'X' || @board[position] == 'O'
    end
  
    def valid_move?(int)
      !position_taken?(int) && int < @board.length
      # !position_taken?(int) && @board[int] == ' '
    end
  end
  
  TicTacToe.new
  