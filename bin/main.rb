#!/usr/bin/env ruby

require_relative '../lib/player'
require_relative '../lib/game'

class TicTacToe
  def initialize
    player_a = Player.new(input_names('X'))
    player_b = Player.new(input_names('O'))
    @game = Game.new(player_a, player_b)
    # @game.assign_players
    game_loop
  end

  def game_loop
    loop do
      @game.set_current_player
      puts @game.display_turn
      puts @game.display_board
      input_position
      if @game.determine_winner
        puts @game.game_over(@game.determine_winner)
      elsif @game.turn_count >= 9 && !@game.determine_winner
        puts @game.game_over(nil)
      end
      if @game.determine_winner || @game.turn_count >= 9
        puts @game.display_board
        exit
      end
    end
  end

  def input_position
    puts "#{@game.current_player.name}, choose position to add your symbol to : 1-9"
    choice = gets.chomp.to_i - 1
    if choice >= 0 && @game.valid_move?(choice)
      @game.make_move(choice)
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
