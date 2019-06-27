class Driver
    attr_accessor :x
    attr_accessor :y
    attr_accessor :name
    attr_accessor :coordinate
    attr_accessor :rating
    attr_accessor :total_rating
    attr_accessor :trip

    def initialize(c)
        names =["Alpha", "Beta", "Charlie", "Delta", "Echo"].sample
        @coordinate = c
        @x = c.x
        @y = c.y
        @name = names
        @rating = 0
        @total_rating = []
        @trip = 0
    end
end
