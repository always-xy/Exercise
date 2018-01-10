# 随机数的种子一样，得到的值就有可能重复
r1 = Random.new(1)
p [r1.rand, r1.rand]

r2 = Random.new(1)
p [r2.rand, r2.rand]

# 不指定随机数的种子，得到随机的随机数

r1 = Random.new
p [r1.rand, r1.rand]

r2 = Random.new
p [r2.rand, r2.rand]