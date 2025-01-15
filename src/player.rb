require './tile'
require './game_state'
require 'pp'


# TODO implement position to tile map for roll dice function

class Player 
    attr_accessor :name, :cash, :position, :holdings, :num_houses, :debug, :sets

    def initialize(name)
        @name = name
        @cash = 1500
        @position = 0
        @roll = 0
        @debug = false
        @holdings = []
        @prop_sets = {navy: false, light_blue: false, brown: false,
                      orange: false, red: false, yellow: false,
                      green: false, blue: false}
        @turn_info = ''
        @set = ''
    end

    def roll_dice()
        @turn_info = ' '
        @roll = rand(1..6) + rand(1..6)
        @turn_info += "#{@name} rolls a #{@roll}"
        
        @position += @roll
        if @position > 39 # replace with gameboard length method 
            @cash += 200 # for passing go
            @position = @position % 39 - 1
            @turn_info +=  "-> #{@name} landed on #{@position}" 
        end
        @turn_info += "\n#{@name} landed on #{@position}"  

    end 

    # post dice roll logic
    # TODO implement upgrade and trade logic
    def complete_turn()      

    end

    def purchase(property)
        @holdings << property 
        @cash -= property.price
        @turn_info += " -> " + @name + " bought " + property.info
        self.check_for_sets()        
        property.update_owner(self)        
    end

    def toggle_debug
      @debug = true
    end

    def upgrade_prop(property)
      
    end

    # iterates through players holdings and counts colors. If enough a one color, update prop sets
    # from False to True
    def check_for_sets()
      set_counts = {navy: 0, light_blue: 0, brown: 0,
      orange: 0, red: 0, yellow: 0,
      green: 0, blue: 0}
      
      set_counts.default = 0

      @holdings.each do |prop|
        set_counts[prop.color] += 1
        
      end    
      
      
    end

    def draws_event(property)
        event = property.generate_event()
        
        if property.is_a?(Chance)
          @turn_info += " -> " + @name + " drew a Chance card." 
            case event

            when 0
              return self.move_player_to(0) # Advance to GO
            
            when 1
              return self.move_player_to(21) # Advance to Ill Ave
              # need pass GO logic...get current player position and compare to Ill ave
    
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
          @turn_info += "-> " + @name + " drew a Community Chest card." 
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
      @turn_info += " -> #{@name} paid $#{amount} to " + player.name
      player.cash += amount
    end

    def charge_player(amount, player)
      @cash -= amount * @roll
      player.cash += amount * @roll
    end

    def update_cash(amount)
      @cash += amount
    end
    
    def status
      if @debug
        puts "#{@name} has $#{@cash} and the following properties"
        @holdings.each {|prop| puts prop.info}  
      end         
    end

    def cash_on_hand
      if @debug
        puts "#{@name} has $#{@cash} on hand"
      end
    end

    def current_holdings
        puts "\n #{@name}"
        @holdings.each {|prop| puts prop.info}        
    end

    def turn_summary()
      return @turn_info
    end
end