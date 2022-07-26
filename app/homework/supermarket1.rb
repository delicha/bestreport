def calc(array)
  if array.length < 3
    puts array.length * 100
  elsif array.length <= 10
    puts array.length * 100 - 50
  else
    puts "You can only buy up to 10 products at the same time."
  end
end

calc([1,1,1,1])
