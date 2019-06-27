filename = 'format.txt'
arr = File.read(filename).split(" ")
total_driver = arr[5].to_i+5

arr[6..total_driver].each do |x|
    arrC = x.split("-")[1].split(",").map(&:to_i)
    puts arrC[0]
    puts arrC[1]
end

puts arr[total_driver+1]