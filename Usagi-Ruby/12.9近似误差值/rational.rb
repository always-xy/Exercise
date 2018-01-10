#10进制中会用10取幂后的倒数来表示数值，float类的小数则是用2的倒数来表示。因此处理非2进制的数值时会产生误差，此时可以用Rational来进行有理数运算，避免误差。
a = Rational(1, 10) + Rational(2, 10)
b = Rational(3, 10)
p [a,b]
p a == b