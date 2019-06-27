class Route
    attr_reader :get
    attr_reader :distance
    attr_reader :routeArray

    def initialize(user, driver, store)
        pointer = []
        route = []
        src = driver
        dest = store
        pointer.push(*src.coordinate.get)
        res = ["Start at #{pointer}"]
        destination_x = dest.coordinate.x
        destination_y = dest.coordinate.y

        if src.coordinate.x < destination_x
            (destination_x - src.coordinate.x).times do
                pointer[0] = pointer[0] += 1
                res.push("- Go to #{pointer}")
                route.push([pointer[0], pointer[1]])
            end

            if src.coordinate.y < destination_y
                (destination_y - src.coordinate.y).times do
                    pointer[1] = pointer[1] += 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            elsif src.coordinate.y > destination_y
                (src.coordinate.y - destination_y).times do
                    pointer[1] = pointer[1] -= 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            else

            end
        elsif src.coordinate.x > destination_x
            (src.coordinate.x - destination_x).times do
                pointer[0] = pointer[0] -= 1
                res.push("- Go to #{pointer}")
                route.push([pointer[0], pointer[1]])
            end

            if src.coordinate.y < destination_y
                (destination_y - src.coordinate.y).times do
                    pointer[1] = pointer[1] += 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            elsif src.coordinate.y > destination_y
                (src.coordinate.y - destination_y).times do
                    pointer[1] = pointer[1] -= 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            else

            end
        else
            if src.coordinate.y < destination_y
                (destination_y - src.coordinate.y).times do
                    pointer[1] = pointer[1] += 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            elsif src.coordinate.y > destination_y
                (src.coordinate.y - destination_y).times do
                    pointer[1] = pointer[1] -= 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            else
            
            end
        end

        res.push("- Finish at #{pointer}")
        res.push("Driver is bringing your food")

        pointer = []
        route = []
        src = store
        dest = user
        pointer.push(*src.coordinate.get)
        res = ["Start at #{pointer}"]
        destination_x = dest.coordinate.x
        destination_y = dest.coordinate.y

        if src.coordinate.x < destination_x
            (destination_x - src.coordinate.x).times do
                pointer[0] = pointer[0] += 1
                res.push("- Go to #{pointer}")
                route.push([pointer[0], pointer[1]])
            end

            if src.coordinate.y < destination_y
                (destination_y - src.coordinate.y).times do
                    pointer[1] = pointer[1] += 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            elsif src.coordinate.y > destination_y
                (src.coordinate.y - destination_y).times do
                    pointer[1] = pointer[1] -= 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            else

            end
        elsif src.coordinate.x > destination_x
            (src.coordinate.x - destination_x).times do
                pointer[0] = pointer[0] -= 1
                res.push("- Go to #{pointer}")
                route.push([pointer[0], pointer[1]])
            end

            if src.coordinate.y < destination_y
                (destination_y - src.coordinate.y).times do
                    pointer[1] = pointer[1] += 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            elsif src.coordinate.y > destination_y
                (src.coordinate.y - destination_y).times do
                    pointer[1] = pointer[1] -= 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            else

            end
        else
            if src.coordinate.y < destination_y
                (destination_y - src.coordinate.y).times do
                    pointer[1] = pointer[1] += 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            elsif src.coordinate.y > destination_y
                (src.coordinate.y - destination_y).times do
                    pointer[1] = pointer[1] -= 1
                    res.push("- Go to #{pointer}")
                    route.push([pointer[0], pointer[1]])
                end
            else
            
            end
        end
        res.push("- Finish at #{pointer}")
        res.push("Enjoy your food")
        @get = res
        @distance = generateDistance(src, dest)
        @routeArray = route
    end


    def generateDistance(src, dest)
        (src.coordinate.x - dest.coordinate.x).abs + (src.coordinate.y - dest.y).abs
    end
end