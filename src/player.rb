class Player 
    attr_accessor :name, :cash, :position, :holdings

    def initialize(name)
        @name = name
        @cash = 1500
        @position = 0
        @holdings = []
    end

    def roll_dice()
        roll = rand(1..6) + rand(1..6)
        puts "#{@name} rolls a #{roll}"
        @position += roll
        if @position > 39 # replace with gameboard length method 
            @position = @position % 39
        end  

    end 

    def purchase(property)
        @holdings << property 
    end

    def pay_player(amount, player)
        @cash -= amount
        player.cash += amount
    end 
end