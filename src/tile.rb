require './player'

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
 
    end

end

class Community < Tile  # similar to chance but with different random events
 
  
  def initialize(name)
      super(name)
  end

  def generate_event
    event = rand(0..11)
     
  end

end

class Free_Parking < Tile
  
  def initialize(name)
    super(name)
  end

  def generate_event
    event = 20     
  end

end

class Jail < Tile

  def initialize(name)
    super(name)
  end

  def generate_event
    event = rand(0..11)
     
  end

end 

class Go_To_Jail < Tile
  
  def initialize(name)
    super(name)
  end
  
  def send_to_jail
    return move_player_to(0) # Send to jail space
  end

  def generate_event
    event = rand(0..11)
     
  end
end