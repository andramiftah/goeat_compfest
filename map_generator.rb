require_relative "user"
require_relative "driver"
require_relative "store"
require_relative "coordinate"
require_relative "format"
require_relative "map"

$stores_name = [["Warteg", {"Ayam" => 10,"Udang" => 20,"Kerang" => 30}], ["KFC", {"Paha_atas" => 5, "Sayap" => 7, "Paha_bawah" => 9}], ["Upnormal", {"Mie_goreng" => 12, "Mie_rebus" => 15, "Mie_bakar" => 18}]]

class MapGenerator
    attr_accessor :map
    attr_accessor :drivers
    attr_accessor :user
    attr_accessor :stores

    def initialize
        @map = 0
        @drivers = 0
        @user = 0
        @stores = 0
    end

    def generate(args)
        if args.size == 0
            @drivers = drawRandomDrivers(5,20)
            @user = drawRandomUser(20)
            @stores = drawRandomStores(3, 20)

            gmap(20)
        
        elsif args.size==1
            data = Format.new(args[0])

            @drivers = data.drivers
            @user = data.user
            @stores = data.stores
            
            gmap(data.mapsize)
        
        elsif args.size==3
            @drivers=drawRandomDrivers(5,args[0].to_i)
            @stores = drawRandomStores(3, args[0].to_i)
            @user = User.new(Coordinate.new(args[1].to_i, args[2].to_i))

            gmap(args[0].to_i)
        end
    end

    def gmap(mapsize)
        @map = Map.new(mapsize)
        @map.addDrivers(@drivers)
        @map.addStores(@stores)
        @map.addUser(@user)
    end

    def drawRandomUser(mapsize)
        a = User.new(Coordinate.new(mapsize))
        a
    end

    def drawRandomDrivers(n, mapsize)
        drivers = {}
        while drivers.size < n
            to_driver = Driver.new(Coordinate.new(mapsize))
            if drivers.key?(to_driver.name) || drivers.has_value?([to_driver.x, to_driver.y])
                
            else
                drivers[to_driver.name] = [to_driver.x, to_driver.y]
            end
        end
        
        result = {}
        drivers.each do |key, val|
            result[key] = Driver.new(Coordinate.new(mapsize))
            result[key].coordinate = Coordinate.new(val[0], val[1])
            result[key].x = val[0]
            result[key].y = val[1]
            result[key].name = key
        end

        result.values
    end

    def drawRandomStores(n, mapsize)
        stores = {}
        i = 0
        while stores.size < n
            to_store = Store.new($stores_name[i][0].capitalize, Coordinate.new(mapsize))
            if stores.key?(to_store.name) || stores.has_value?([to_store.x, to_store.y])
                
            else
                stores[to_store.name] = [to_store.x, to_store.y]
            end
            i += 1
        end
        
        result = {}
        i = 0
        stores.each do |key, val|
            result[key] = Store.new($stores_name[i][0].capitalize, Coordinate.new(mapsize))
            result[key].generate_menu($stores_name[i][1])
            result[key].coordinate = Coordinate.new(val[0], val[1])
            result[key].x = val[0]
            result[key].y = val[1]
            result[key].name = key
            i += 1
        end
        result.values
    end 

    def getNearestDriver(store)
        nearestDriver = nil
        nearestDistance = 99999
        s = store.coordinate
        drivers.each do |d|
            distance = (s.x - d.coordinate.x).abs + (s.y - d.coordinate.y).abs
            if distance<nearestDistance
                nearestDistance = distance
                nearestDriver = d
            end
        end
        nearestDriver
    end

    def randomizeDriverFrom(order)
        intoHash = []
        theDriver = 0
        @drivers.each do |d|
            if d.name != order.driver.name
                intoHash.push(d.name)
                intoHash.push(d.coordinate.get)
            else
                theDriver = d
            end
        end
        drivers = HASH[intoHash.each_slice(2).to_a]

        sizeEst = drivers.size + 1
        while drivers.size != sizeEst
            newCoordinate = Coordinate.new(@map.height)
            theDriver.coordinate = newCoordinate
            theDriver.x = newCoordinate.x
            theDriver.y = newCoordinate.y

            if drivers.key?(theDriver.name) || drivers.has_value?([theDriver.x, theDriver.y])

            else 
                drivers[theDriver.name] = [theDriver.x, theDriver.y]
            end
        end

        result = {}
		drivers.each do |key, val| 
			result[key] = Driver.new(Coordinate.new(@map.height))
			result[key].coordinate = Coordinate.new(val[0],val[1])
			result[key].x = val[0]
			result[key].y = val[1]
			result[key].name = key 
        end
        
        result.values
    end

    def generateMapRoute(order)
        routeMap = @map
        routeMap.addRoute(order)
        routeMap
    end
end



