#使用简单的矩阵
a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
p a

b = Array.new(3, [0, 0, 0])
p b

c = Array.new(3, [0, 0, 0])
c[0][1] = 2
p c

d = Array.new(3) do
  [0, 0, 0]
end
p d
d [0][1] = 2
p d

e = Array.new(5) {|i| i + 1}
p e