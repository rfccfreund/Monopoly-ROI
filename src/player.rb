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
        if @position > 39 # replace with gameboard length method 
            @cash += 200 # for passing go
            @position = @position % 39 - 1
        end  

    end 

    def purchase(property)
        @holdings << property 
        @cash -= property.price
        property.update_owner(self)
    end

    def draws_event(property)
        event = property.generate_event()
        
        if property.is_a?(Chance)
            case event

            when 0
              return self.move_player_to(0) # Advance to GO
            
            when 1
              return self.move_player_to(21) # Advance to Ill Ave
              # need pass GO logic...maybe an array of functions to return
    
            when 2
              return self.move_player_to(6) # advance to St. Charles
    
            when 3
              return self.move_player_to(15) # advance to nearest utility 
            
            when 4
              return self.move_player_to(10) # advance to the nearest railroad
    
            when 5
              return self.move_player_to(50) # Bank pays dividend
    
            when 6
              return self.move_player(-3) # move player back 3 spaces
    
            when 7
              return self.move_player_to(10) # move player to jail
    
            when 8 
              return self.move_player_to(11) # move player to reading railroad
    
            when 9 
              return self.update_cash(-15) # pay poor take of -15
    
            when 10
              return self.move_player_to(20) # advance to boardwalk
    
            when 11
              return self.update_cash(150)
            
            end
        
        elsif property.is_a?(Community)  
            case event

            when 0
              return self.move_player_to(0) # Advance to GO
            
            when 1
              return self.update_cash(200) # Bank error in your favor
        
            when 2
              return self.update_cash(-50) # Doctor fees
        
            when 3
              return self.update_cash(100) # Holiday fund matures
            
            when 4
              return self.update_cash(20) # income tax refund
        
            when 5
              return self.update_cash(100) # life insurance pay out
        
            when 6
              return self.update_cash(-100) # hospital fees
        
            when 7
              return self.update_cash(-50) # school fees
        
            when 8 
              return self.update_cash(25) # consultancy fee
        
            when 9 
              return self.update_cash(-15) # pay poor take of -15
        
            when 10
              return self.update_cash(10) # beauty contest
        
            when 11
              return self.update_cash(100) # inheritance 
            end
        else
            return self.update_cash(0)
        end

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