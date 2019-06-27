class Map
    attr_reader :height
    attr_reader :width

    #Inisiasi map
    def initialize(n)
        @height = n
        @width = n
        @print = Array.new(@width) { Array.new(@height) {'.'} }
    end

    # Print map
    def printMap
        y = @height
        batas = @width
        while y >= 0
            x = 0
            print "| " if y < @height
            while x < batas
                print "#{@print[x][y]}"
                x += 1
            end
            puts ""
            y -= 1
        end
        puts "-" * batas
        nil
    end

    def addUser(user)
        @print[user.x - 1][user.y - 1] = "*"
    end

    def removeUser(user)
        @print[user.x - 1][user.y - 1] = "."
    end

    def addDrivers(drivers)
        drivers.each { |d| @print[d.coordinate.x - 1][d.coordinate.y - 1] = "#{d.name[0]}"}
    end

    def addStores(stores)
        stores.each { |s| @print[s.coordinate.x - 1][s.coordinate.y - 1] = "#{s.name[0]}'"}
    end

    def clearMap
        @print = Array.new(@width) { Array.new(@height) { "."} }
    end

    def addRoute(order)
        arr = order.route.routeArray
        arr.each{ |r| @print[r[0] - 1][r[1] - 1] = "o"}
        nil
    end
end