# n.times[|i|] 循环n次，从0到n-1的值会被依次赋予给块的变量
ary = []
10.times do |i|	
  ary << i		#位左移
end

p ary


#from.upto(to){|i|} 从from开始循环对i进行加1处理，直到i等于to from比to大时不会执行循环处理
ary = []
2.upto(10) do |i|
  ary << i
end

p ary


# from.down(to){|i|} 从from开始循环对i进行减1处理，直到i等于to。from比to小时不会执行循环处理
ary = []
10.downto(2) do |i|
  ary << i
end 

p ary


#from.step(to,step){} 从from开始循环对i进行加step处理，直到i等于to。step为整数时，from比to大时不会执行，step为负数时，from比to小时不会处理
ary = []
2.step(10,3) do |i|
  ary << i
end
p ary

ary = []
10.step(2,-3) do |i|
  ary << i
end
p ary