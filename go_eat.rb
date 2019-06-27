require_relative "map_generator"
require_relative "coordinate"
require_relative "order"
require_relative "route"
require_relative "history"

*args = ARGV

Gem.win_platform? ? (system "cls") : (system "clear")

goeat = MapGenerator.new
goeat.generate(args)

history = History.new(goeat)
history.clearHistory

while true
    puts "Welcome to Go-Eat CLI Application"
    puts "Choose what you want to do :"
    puts "1. Show Map"
    puts "2. Order Food"
    puts "3. View history"
    puts "4. Quit"

    print ">"
    choice = $stdin.gets.chomp.to_i

    case choice
    when 1
        Gem.win_platform? ? (system "cls") : (system "clear")
        goeat.map.printMap
        puts ""
    when 2
        Gem.win_platform? ? (system "cls") : (system "clear")
        stores = goeat.stores
        puts "Choose the restaurant : "
        i = 1
        stores.each do |store|
            puts"#{i}. #{store.name}"
            i += 1
        end
        print "Insert the number > "
        rest_index = $stdin.gets.chomp.to_i
        rest = stores[rest_index-1]
        nearest = goeat.getNearestDriver(rest)
        route = Route.new(goeat.user, nearest, rest)
        order = Order.new(nearest, goeat.user, rest, route)
        order.order_food
        history.order = order
        history.put
        puts "Route > "
        puts *order.route.get
        order.give_rating
        puts "--" * 20
        pause = $stdin.gets.to_s.chomp.split(",").map(&:to_i)
        Gem.win_platform? ? (system "cls") : (system "clear")
    when 3
        Gem.win_platform? ? (system "cls") : (system "clear")
        puts history.readHistory
    when 4
        Gem.win_platform? ? (system "cls") : (system "clear")
        puts "Thanks for using Go-Eat!"
        break
    else
        puts "Wrong Input"
        puts "Quitting..."
        break
    end
end