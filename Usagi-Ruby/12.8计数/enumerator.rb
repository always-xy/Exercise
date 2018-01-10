#如果不对time upto downto step的方法指定块，则会返回enumerator对象。这样，之前通过step方法的块取的一连串数值，就同样业可以通过enumerator#collect方法获取。
ary = 2.step(10).collect{|i| i * 2}
p ary