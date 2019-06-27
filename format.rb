require_relative "user"
require_relative "driver"
require_relative "store"
require_relative "coordinate"

class Format
    attr_reader :mapsize
    attr_reader :user
    attr_reader :drivers
    attr_reader :stores
    attr_reader :menus
    attr_reader :total_driver

    def initialize(filename)
        @mapsize = translate(filename, "mapsize")
        @user = translate(filename, "user")
        @drivers = translate(filename, "drivers")
        @stores = translate(filename, "stores")
    end

    def translate(filename, type)
        result = 0
        arr = File.read(filename).split(" ")

        case type
        when "mapsize"
            result = arr[1].to_i
        
        when "user"
            c = arr[3].split(",").map(&:to_i)
            result = User.new(Coordinate.new(c[0], c[1]))

        when "drivers"
            result = []
            @total_driver = 5 + arr[5].to_i
            arr[6..total_driver].each do |x|
                arrC = x.split("-")[1].split(",").map(&:to_i)
                c = Coordinate.new(arrC[0],arrC[1])
                d = Driver.new(c)
                d.name = x.split("-")[0]
                result.push(d)
            end

        when "stores" 
            result = []
            total_store = arr[@total_driver + 2].to_i
            iter = 3 + @total_driver
            for i in 0..total_store-1
                name = arr[iter].split("-")[0]
                arrC = arr[iter].split("-")[1].split(",").map(&:to_i)
                c = Coordinate.new(arrC[0],arrC[1])
                s = Store.new(name.capitalize, c)
                menus= {}
                iter += 1
                total_menu = arr[iter].to_i
                for j in 0..total_menu-1
                    iter+=1
                    menu_name =arr[iter].split("-")[0]
                    menu_price = arr[iter].split("-")[1].to_i
                    menus[menu_name.capitalize] = menu_price
                end
                s.generate_menu(menus)
                result.push(s)
                iter += 1
            end
        end
        result
    end
end
        

                    

                

            
            