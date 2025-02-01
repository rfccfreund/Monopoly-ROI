require './tile'
require './game_state'
require 'pp'


# TODO implement position to tile map for roll dice function

class Player 
    attr_accessor :name, :cash, :position, :holdings, :num_houses, :debug, :sets, :is_active

    def initialize(name)
        @name = name
        @cash = 900
        @position = 0
        @roll = 0
        @debug = false
        @holdings = []
        @prop_sets = {navy: false, light_blue: false, brown: false,
                      orange: false, red: false, yellow: false,
                      green: false, blue: false}
        @turn_info = ''
        @set = ''
        @transactions = [] # list for storing transaction data 
        @is_active = true # status used to know if a player should take a turn or not
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
      if @cash < 100
        @turn_info += "\n -> #{@name}: I'm a poor boy from a poor family. #{@cash}"
      elsif @cash < 500
        @turn_info += "\n -> #{@name}: We're in the danger zone. #{@cash}"
      elsif @cash < 1000
        @turn_info += "\n #{@name}: I'm burning through capital. #{@cash}"
      end

      self.display_sets()

      # logic for using the upgrade prop function 
    end

    def purchase(property)
        @holdings << property 
        @cash -= property.price
        @turn_info += " -> " + @name + " bought " + property.info
        self.check_for_sets()        
        property.update_owner(self)        
    end

    def toggle_debug!
      @debug = true
    end

    def upgrade_prop!(property)
      if property.num_houses < 1
        property.build_house()
        player.cash -= 100
      end
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
      
      if set_counts[:navy] == 2
        @prop_sets[:navy] = true
      else
        @prop_sets[:navy] = false
      end
      
      if set_counts[:light_blue] == 3
        @prop_sets[:light_blue] = true
      else
        @prop_sets[:light_blue] = false 
      end 

      if set_counts[:brown] == 3
        @prop_sets[:brown] = true
      else
        @prop_sets[:brown] = false 
      end 

      if set_counts[:orange] == 3
        @prop_sets[:orange] = true
      else
        @prop_sets[:orange] = false 
      end 

      if set_counts[:red] == 3
        @prop_sets[:red] = true 
      else
        @prop_sets[:red] = false
      end 

      if set_counts[:yellow] == 3
        @prop_sets[:yellow] = true 
      else
        @prop_sets[:yellow] = false
      end 

      if set_counts[:green] == 3
        @prop_sets[:green] = true 
      else
        @prop_sets[:green] = false
      end 

      if set_counts[:blue] == 2
        @prop_sets[:blue] = true 
      else
        @prop_sets[:blue] = false
      end 
    end

    def display_sets()
      @prop_sets.each do |key, value|        
        puts "Your order includes: #{value} #{key}."
      end    
    end

    # count the number of each color to determine if there is a set 
    def count_sets()
      set_counts = {navy: 0, light_blue: 0, brown: 0,
      orange: 0, red: 0, yellow: 0,
      green: 0, blue: 0}
      
      set_counts.default = 0

      @holdings.each do |prop|
        set_counts[prop.color] += 1        
      end    
      
      pp set_counts      
    end

    # generate_event() is a method that returns a random number
    def draws_event(property)
<<<<<<< HEAD
        
=======
        # generate_event() is a method that returns a random number
>>>>>>> 790e8b950bf0849cc98c489ea3980a6ab271581d
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

    # function changes position to a certain number
    def move_player_to(int)
      @position = int
    end 
    
    # updates player position by a certain number
    def move_player(int)
      @position += int
    end

    # update a player cash on hand by a number (int)
    def pay_player(amount, player)
      @cash -= amount
      @turn_info += " -> #{@name} paid $#{amount} to " + player.name
      player.cash += amount
    end

    # reduces a player on hand by a number (int)
    def charge_player(amount, player)
      @cash -= amount * @roll
      player.cash += amount * @roll
    end

    # changes cash attribute of a player by some amount
    def update_cash(amount)
      @cash += amount
    end
    
    # checks debug status to print out information on a player objects 
    def status
      if @debug
        puts "#{@name} has $#{@cash} and the following properties"
        @holdings.each {|prop| puts prop.info}  
      end         
    end

    # getter for cash attribute
    def cash_on_hand      
      puts "#{@name} has $#{@cash} on hand"
    end


    def current_holdings
      @holdings.each {|prop| puts prop.info}        
    end

    def turn_summary()
      return @turn_info
    end

    
    def lose_game!()
      @is_active = false
    end
end