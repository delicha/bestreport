def  hello
  puts  "Hello World"
end

def area(x, y)
  puts  x * y / 2
end

def greater(x, y)
  if x > y
    puts 'x > y'
  elsif x < y
    puts 'x < y'
  else
    puts 'x == y'
  end
end

def train_fare(age)
  if age >= 12
    puts '200円'
  elsif age >= 6
    puts '100円'
  else
    puts '0円'
  end
end

def xor(x, y)
  if x == true && y == true || x == false && y == false
    puts false
  elsif
    puts true
  end
end

def hello
  for i in 1..100 do
    puts 'こんにちわ'
  end
end

def sheep(n)
  for i in 1..n do
    puts '羊が' + "#{i}" + '匹'
  end
end

def sum_1_100
  range = 1..100
  p range.sum
end

def sum(x, y)
  range = x..y
  p range.sum
end

def double(nums)
  nums.each do |n| 
    p n * 2
  end
end

def reverse(nums) 
  p nums.reverse
end

def missing_nums(nums)
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  for i in 0..nums.length do
    array.delete(nums[i])
  end
  p array
end

def leap_year(x, y)
  for i in x..y do
    if i%4==0 || i%400==0
      unless i%100==0
        p i
      end
    end
  end
end


def divisor_count(x, y, z)
  array = []
  for i in 5..12 do
    if 90 % i == 0
      array = array.push(i)     
    end  
  end
  puts array.count
end

def findPairs(nums)
   p nums.select{ |e| nums.count(e) > 1 }.uniq.sort
end
  


def fact(n)
  array = []
  for i in 1..n do
    result = 1
    array = array.push(i)
    array.each {|val| result *= val }
  end
  p result
end


def divede_count(n)
  array = []
  while n%5==0 
    n=n/5
    array.push(n)
  end
  p array.count
end



def fibonacci(n)
  if n == 0 
    p 0
  elsif n == 1
    p 1
  else
    p fibonacci(n-1) + fibonacci(n-2)
  end
end


# fibonacci(0)
# fibonacci(1)
# fibonacci(2)
# fibonacci(3)
# fibonacci(4)
# fibonacci(7)
# fibonacci(30)

ary = [
  ["０ああああ","０いいいいい","０うううう"],
  ["１ああああ","１いいいいい","１うううう"]
]

def comment(sex, comment)
  ary = [
    ["０ああああ","０いいいいい","０うううう"],
    ["１ああああ","１いいいいい","１うううう"]
  ]

      p ary[0][1]

end

comment(0, 2)



