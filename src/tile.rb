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
    end

    def info
        super + ", Price: #{@price}, Rent: #{@rent}"
    end

    def purchase
        @is_owned = true
    end
end