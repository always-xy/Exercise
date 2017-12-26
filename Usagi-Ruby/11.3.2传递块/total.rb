def total(from, to)
  result = 0				#合计值
  from.upto(to) do |num|	#处理从from到to的数值
  	if block_given?			#如果有块
  	  result += yield(num)	#  执行累加经过块处理的值
  	else					#如果没有块
  	  result += num			#  执行直接累加
  	end
  end
  return result				#返回结果
end

p "从1到10的累计相加和为：#{total(1, 10)}"
p "从1到10的累计相乘的和为：#{total(1, 10){|num| num ** 2}}"