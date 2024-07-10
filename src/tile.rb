class Tile
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def info
        "#{@name}"
    end
end

class Property < Tile
    attr_accessor :price, :rent, :is_owned

    def initialize(name, price, rent)
        super(name)
        @price = price
        @rent = rent
        @is_owned = false 
        @revenue = 0
    end

    def info
        super + ", Price: #{@price}, Rent: #{@rent}"
    end

    def update_owner(player)
        @is_owned = player
    end

    def generate_income
        @revenue += @rent
    end 

    def return_on_investment
      @revenue.to_f / @price.to_f
    end
end

class Go < Tile 
  attr_accessor :payday
  
  def initialize(name)
    super(name)
    @payday = 200
  end

  def info
    super + "You collected #{@payday}"
  end 

  def pass_go(player)
    player.cash += @payday    
  end
end 

class Chance < Tile
  
    def initialize(name)
        super(name)
    end

    def generate_event
      event = rand(0..11)

      case event

      when 0
        return move_player_to(0) # Advance to GO
      
      when 1
        return move_player_to(21) # Advance to Ill Ave
        # need pass GO logic...maybe an array of functions to return

      when 2
        return move_player_to(2) # advance to St. Charles

      when 3
        return move_player_to(15) # advance to nearest utility 
      
      when 4
        return move_player_to(10) # advance to the nearest railroad

      when 5
        return update_cash(50) # Bank pays dividend

      when 6
        return move_player(-3) # move player back 3 spaces

      when 7
        return move_player_to(10) # move player to jail

      when 8 
        return move_player_to(11) # move player to reading railroad

      when 9 
        return update_cash(-15) # pay poor take of -15

      when 10
        return move_player_to(20) # advance to boardwalk

      when 11
        return update_cash(150)

      end



    end

end
