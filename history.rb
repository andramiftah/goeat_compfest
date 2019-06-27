class History
    attr_accessor :order
    
    def initialize(goeat)
        @order = nil
        @goeat = goeat
        @total = 0
    end

    def put
        @total = @total+1
        arr = ["{#{@total}"]
        arr.push("Order from #{@order.store.name} at #{@order.store.coordinate.get}")
        arr.push("Driver's name : #{@order.driver.name}")
        arr.push("Deliver to : #{@goeat.user.coordinate.get}")
        arr.push("Item's ordered :")
        arr.push("Menu - Harga - Quantity - Delivery fee")
        @order.cart.each do |item|
            arr.push("#{item[0]} - #{item[1]} -#{item[2]} -#{item[3]}")
        end
        arr.push("Total price : #{@order.total_price}")
        arr.push("Route :")
        arr.push(*order.route.get)
        File.open("history.txt", "a") do |f|
            f.puts(arr)
        end
        nil
    end

    def readHistory
        result = ""
        if File.zero?("history.txt")

        else 
            history = File.read("history.txt")
            result = history
        end
        result
    end

    def clearHistory
        File.truncate("history.txt",0)
    end
end