class Store
    attr_accessor :x
    attr_accessor :y
    attr_accessor :name
    attr_accessor :coordinate
    attr_accessor :menu

    def initialize(name, c)
        @name = name
        @coordinate = c
        @x = c.x
        @y = c.y
        @menu = {}
    end

    def generate_menu(menus)
        menus.each do |menu,price|
            @menu[menu.capitalize] = price
        end
        @menu
    end

    def show_menu
        puts "#{@name} Menu"
        puts "Menu | Price"
        @menu.each do |menu,price|
            puts "#{menu} | #{price}"
        end
    end
end
