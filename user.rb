class User
    attr_accessor :x
    attr_accessor :y
    attr_accessor :coordinate

    def initialize(c)
        @coordinate = c
        @x = c.x
        @y = c.y
    end
end