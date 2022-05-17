def grouping()
	for i in 1..30
		# if i % 2 == 0 && i % 6 != 0 && i % 3 != 0
		# 	puts "#{i}:"+'桜組'
		# elsif i % 3 == 0 && i % 6 != 0 && i % 2 != 0
		# 	puts "#{i}:"+'桃組' 
		# elsif i % 6 == 0 
		# 	puts "#{i}:"+'藤組' 
		# else
		# 	puts "#{i}:"+'欅組' 
		# end
		# if i % 6 == 0 
		# 	puts "#{i}:"+'藤組'
		# 	if i % 3 == 0
		# 		puts "#{i}:"+'桃組' 
		# 	elsif i % 2 == 0
		# 		puts "#{i}:"+'桜組'
		# 	end
		# else
		# 	puts "#{i}:"+'欅組' 
		# end
		if i % 6 == 0 
			puts "#{i}:"+'藤組'
		elsif i % 3 == 0
			puts "#{i}:"+'桃組' 
		elsif i % 2 == 0
			puts "#{i}:"+'桜組'
		else
			puts "#{i}:"+'欅組' 
		end
	end
end

grouping()
