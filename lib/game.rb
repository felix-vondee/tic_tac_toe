
class Game
  def initialize(player_a, player_b)
    @player_a = player_a
    @player_b = player_b
  end

  def start
    assign_players
    game_loop
  end

  def game_loop
    loop do
      set_current_player
      display_turn(@current_player.name)
      @board.display
      input_position
      game_over(nil) if turn_count >= 9
    end
  end

  def display_turn(player)
    puts "it's #{@current_player}'s turn!"
  end

  def turn_count
    count = 0
    @board.get_data.each { |e| count += 1 if %w[X O].include?(e) }
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
    if @current_player == @player_a
      x = []
      @board.get_data.each_with_index { |el, index| x << index if el == 'X' }
      WINNING_COMBINATIONS.each do |i|
        return @current_player if i == x
      end
    elsif @current_player == @player_b
      o = []
      @board.get_data.each_with_index { |el, index| o << index if el == 'O' }
      WINNING_COMBINATIONS.each do |i|
        return @current_player if i == o
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
    @player_b = Player.new(input_names('Y'))
  end

  def make_move(position)
    @board.add('X', position) if @current_player == @player_a
    @board.add('O', position) if @current_player == @player_b
    game_over(determine_winner) if determine_winner
  end

  def valid_move?(int)
    !@board.position_taken?(int) && int < @board.size
  end

end