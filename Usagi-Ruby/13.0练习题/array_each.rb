# 创建数组
a = (1..100).to_a

# (a) 使用Array#each方法求和
result = 0
a.each{|i| result += i }
p result

# (b) 使用Array#inject方法求和
p a.inject(0){|memo, i| memo += i }