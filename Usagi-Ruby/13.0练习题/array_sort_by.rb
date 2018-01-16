# 创建数组
a = (1..100).to_a

# (a) 使用Array#reverse方法
a2 = a.reverse
p a2

# (b) 使用Array#sort方法
a2 = a.sort{|n1, n2| -(n1 <=> n2) }
p a2

# (c) 使用Array#sort_by方法
a2 = a.sort_by{|i| -i }
p a2