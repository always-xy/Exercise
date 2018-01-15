#数组的迭代处理包含each迭代器处理等等。

a = 1..5
b = a.collect{|i| i += 2}
p b