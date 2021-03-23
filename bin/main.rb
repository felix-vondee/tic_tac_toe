#!/usr/bin/env ruby

class TicTacToe
    def initialize
      self.get_names
    end

    def get_names
      puts "Enter your name for player 1 "
      @player_1 = gets.chomp 

      puts "Enter your name for player 2"
      @player_2 = gets.chomp 

    end
end

TicTacToe.new
