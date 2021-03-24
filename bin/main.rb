#!/usr/bin/env ruby

# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

class TicTacToe
  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                          [0, 3, 6], [1, 4, 7], [2, 5, 8],
                          [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @board = Board.new
    player_a = Player.new(input_names('X'))
    player_b = Player.new(input_names('O'))
    @game = Game.new(player_a, player_b)
    #@game.assign_players
    @game.game_loop
  end

  def input_position
    puts "#{@current_player.name}, choose position to add your symbol to : 1-9"
    choice = gets.chomp.to_i - 1
    if choice >= 0 && valid_move?(choice)
      make_move(choice)
    else
      puts 'Invalid move. Try again!'
      input_position
    end
  end

  def input_names(player)
    puts "Enter your name for player #{player} "
    input = gets.chomp
    input_names(player) if input.empty? # restart the method if input is empty
    input
  end

end

TicTacToe.new

# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
