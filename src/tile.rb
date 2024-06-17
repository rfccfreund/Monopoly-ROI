class Tile
    attr_accessor :name

    def iniitialize(name)
        @name = name
    end

    def display
        "Tile Name: #{@name}"
    end
end

class Property < Tile
    attr_accessor :price, :rent, :owned?

    def initialize(name, price, rent)
        supper(name)
        @price = price
        @rent = rent
        @owned = false 
    end

    def display
        super + ", Price: #{@price}, Rent: #{@rent}"
    end
end