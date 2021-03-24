class Player
    attr_reader :name

    def initialize(name)
        @name = name
    end

end

player_a = Player.new('Felix')
player_a