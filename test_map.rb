class Map
    attr_reader :height
    attr_reader :width

    #Inisiasi map
    def initialize(n)
        @height = n
        @width = n
        @print = Array.new(@width) { Array.new(@height) {'.'}}
    end

    # Print map
    def print_map
        y = @height
        x = @width
        for i in 0..(y-1)	
            print "| " if i<y
            for j in 0..(x-1)
                print "#{@print[i][j]} "
            end
            puts ""
        end
        puts "--" * y
        nil
	end
end
map = Map.new(20)
map.print_map