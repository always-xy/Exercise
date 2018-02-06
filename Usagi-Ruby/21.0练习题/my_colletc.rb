def my_collect(obj, &block)
  buf = []
  obj.each do |elem|
    buf << block.call(elem)
  end
  buf
end

ary = my_collect([1,2,3,4,5]) do |i|
  i * 2
end

p ary  #=> [2, 4, 6, 8, 10]

to_class = :class.to_proc
p to_class.call("test")    #=> String
p to_class.call(123)       #=> Fixnum
p to_class.call(2 ** 100)  #=> Bignum

def accumlator
  total = 0
  Proc.new do |x|
    total += x
  end
end

acc = accumlator
p acc.call(1)    #=> 1
p acc.call(2)    #=> 3
p acc.call(3)    #=> 6
p acc.call(4)    #=> 10