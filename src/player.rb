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
        roll = rand(1..6) + rand(1..6)
        puts "#{@name} rolls a #{roll}"
        @position += roll
        if @position > 25 # replace with gameboard length method 
            @cash += 200 # for passing go
            @position = @position % 26
        end  

    end 

    def purchase(property)
        @holdings << property 
        @cash -= property.price
        property.update_owner(self)
    end

    def draws_event(property)
        event = property.generate_event()
        self.event()
    end

    def move_player_to(int)
      @position = int
    end 
    
    def move_player(int)
        @position += int
    end

    def pay_player(amount, player)
        @cash -= amount
        player.cash += amount
    end

    def update_cash(amount)
        @cash += amount
    end
    
    def status
        puts "#{@name} has $#{@cash} and the following properties"
        @holdings.each {|prop| puts prop.info}           
    end

    def cash_on_hand
      puts "#{@name} has $#{@cash} on hand"
    end

    def current_holdings
        puts "\n #{@name}"
        @holdings.each {|prop| puts prop.info}
    end
end