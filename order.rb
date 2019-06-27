class Order
    attr_accessor :driver
    attr_accessor :user
    attr_accessor :store
    attr_accessor :route
    attr_accessor :cart
    attr_accessor :total_price
    attr_accessor :finished

    def initialize(driver, user, store, route)
        @driver = driver
        @user = user
        @store = store
        @route = route
        @cart = {}
        @total_price = 0
        @finished = false
    end

    def show_menu
        puts "#{@store.name} Menu"
        puts "Menu - Harga"
        (@store.menu).each do |menu, price|
            puts "#{menu} - #{price}"
        end
    end    

    def order_menu
        puts "Masukkan menu yang anda pilih dengan format (Nama-Banyaknya)"
        puts "Ketik 'OK' jika sudah selesai pesan dan 'Cancel' untuk mengosongkan pesanan"
        input = $stdin.gets.chomp
        while input.capitalize != "Ok"
            if input.capitalize == "Cancel"
                @cart.clear()
            end
            menu = input.split('-')[0].capitalize
            quantity = input.split('-')[1].to_i
            @cart[menu] = quantity
            input = $stdin.gets.chomp
        end
        puts "\n"
        @cart
    end

    def show_cart(menu, distance)
        while @cart == {}
            puts "Nothing ordered"
            order_menu
        end
        order = []
        puts "Your order"
        puts "Menu - Harga - Quantity - Delivery fee"
        @cart.each_key do |keys|
            if menu[keys] == nil
                puts "#{keys} is not in menu"
                @cart.delete(keys)
            else
                order << [keys, menu[keys], @cart[keys], menu[keys]*distance]
                puts "#{keys} - #{menu[keys]} - #{@cart[keys]} - #{menu[keys]*distance}"
            end
        end
        order
    end

    def store_distance
        distance = (@store.coordinate.x - @user.coordinate.x).abs + (@store.coordinate.y - @user.coordinate.y).abs
        distance
    end

    def get_total_price(orders)
        @total_price = 0
        orders.each do |order|
            @total_price += order[1] * order[2] + order[3]
        end
        puts "Total Biaya : #{@total_price}"
    end

    def finish_order
        puts "Are you sure with your order? [Y/N]"
        ans = $stdin.gets.chomp
        if ans.capitalize == "Y"
            @finished = true
        elsif ans.capitalize == "N"
            @finished = false
        end
        @finished
    end

    def get_order_information(cart)
        order = []
        order << @driver.name << @store.name << cart << @total_price
        puts "Store name : #{@store.name}"
        puts "Store location : #{@store.coordinate.x},#{@store.coordinate.y}"
        distance = store_distance
        puts "Store distance : #{distance}"
        puts "Driver name : #{@driver.name}"
        puts "Driver rating : #{@driver.rating}"
        puts "Order :"
        cart.each do |order|
            puts "#{order[0]} - #{order[1]} - #{order[2]} - #{order[3]}"
        end
        puts "Total price : #{@total_price}"
        order
    end

    def give_rating
        puts "Please give rating (0 - 5) :"
        @cart.clear
        rate = gets.chomp.to_f
        @driver.total_rating << rate
        @driver.trip+=1
        @driver.rating = @driver.total_rating.sum / @driver.total_rating.size
        puts "Thank you"
    end

    def order_food
        show_menu
        order = order_menu
        @cart = show_cart(@store.menu, store_distance)
        total_price = get_total_price(@cart)
        @finished = finish_order
        if @finished==true
            order_info = get_order_information(@cart)
        else 
            order_food
        end
    end 
end