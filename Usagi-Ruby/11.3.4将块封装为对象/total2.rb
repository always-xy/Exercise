def total2(from, to, &block)
  result = 0
  from.upto(to) do |num|
  	if block
  	  result +=
  	  	block.call(num)
  	else
  	  result += num
  	end
  end
  return result
end

p "从1到10的累计相加和为：#{total2(1, 10)}"
p "从1到10的累计相乘的和为：#{total2(1, 10){|num| num ** 2}}"