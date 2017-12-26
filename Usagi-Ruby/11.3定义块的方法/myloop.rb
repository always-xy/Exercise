def myloop
  while true
  	yield
  end
end

num = 1
myloop do
  puts "num is #{num}"
  break num > 100
  num *= 2
end