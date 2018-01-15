#同时索引多个数组
ary1 = [1, 2, 3, 4, 5]
ary2 = [10, 20, 30, 40, 50]
ary3 = [100, 200, 300, 400, 500]

result = []
while i < ary1.length
  result << ary1[i] + ary2[i] + ary[i]
  i += 1
end
p result