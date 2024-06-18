require './tile'

class Player 
    attr_accessor :name, :cash, :position, :holdings

    def initialize(name)
        @name = name
        @cash = 1500
        @position = 0
        @holdings = []
    end

    def roll_dice()
        roll = rand(1..2) + rand(1..2)
        puts "#{@name} rolls a #{roll}"
        @position += roll
        if @position > 4 # replace with gameboard length method 
            @position = @position % 4
            if @position == 0
                @position = 1
            end
        end  

    end 

    def purchase(property)
        @holdings << property 
        @cash -= property.price
        property.update_owner(self)
    end

    def pay_player(amount, player)
        @cash -= amount
        player.cash += amount
    end
    
    def status
        puts "#{@name} has $#{@cash} and the following properties"
        @holdings.each {|prop| puts prop.info}           
    end
end