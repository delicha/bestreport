def train_fare(age)
  if age >= 12
    puts 10000
  elsif age >= 6
    puts 5000
  else
    puts 0
  end
end

train_fare(12)
train_fare(6)
train_fare(0)
