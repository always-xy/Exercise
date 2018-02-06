#创建Proc的典型方法就是使用Proc.new方法，或者使用proc方法指定块。
#例子：
	hello1 = Proc.new do |name|
	  puts "Hello, #{name}"
	end

	hello2 = proc do |name|
	  puts "Hello, #{name}"
	end

	hello1.call("World") #通过调用Proc#call方法执行块。在调用方法什call会变成块变量，其中最后一个表达式的值则为Proc#call的返回值。除外还有一个名称叫Proc。
	hello2.call("Ruby")

#例子：判断西历的年是否为闰年的处理。
	leap = Proc.new do |year|
	  year % 4 == 0 && year % 100 != 0 || year % 400 ==0
	end

	p leap.call(2000)	
	p leap[2013]
	p leap[2018]

#例子：将块变量设置为|*数组|的形式，就可以像方法参数一样，以数组的形式接收可变数量的参数。
	double = Proc.new do |*args|
	  args.map{|i|i * 2} #所有元素乘以2
	end

	p double.call(1, 2, 3)
	p double[2, 3, 4]

#与Proc方法相同的方法叫lambda。lambda可以创建Proc对象，通过lambda方法创建的Proc行为更接近方法。但是lambda方法对参数数量的检查非常严格，不正确就会报错。
	prc1 = Proc.new do |a, b, c|
	  p [a, b, c]
	end
	prc1.call(1, 2)

	prc2 = lambda do |a, b, c|
	  p [a, b, c]
	end
	prc2.call(1, 2, 3)

#lambda可以使用return将值从块中返回。
	def power_of(n)
	  lambda do |x|
	  	return x ** n
	  end
	end

	cube = power_of(3)
	p cube.call(5)

#不是lambda的普通块中的return，会从执行循环的方法返回。
	def prefix (ary, obj)
	  result = []			#初始化数组
	  ary.each do |item|	#逐个检查元素
	  	result << item		#将元素逐个追加到结果数组中
	  	if item == obj		#如果元素和条件一致
	  	  return result		#返回结果数组
	  	end
	  end
	  return result
	end

	prefix([1, 2, 3, 4, 5], 3)

#break被用于控制迭代器的行为，这个命令会将接收块的方法的调用者返回结果值。
	[:a, :b, :c].collect do |item|
	  break []
	end

#lambda有另外一种写法 ->(块变量) {处理}
	square = ->(n){ return n ** 2}
	p square

#在调用块的方法时，通过Proc参数的形式指定块后，该块就会作为Proc对象被方法接收。
	def total2(from, to, &block)
	  result = 0
	  from.upto(to) do |num|
	  	if block
	  	  result +=
	  	block.call(num)
	  	  else
	  	  	result += num
	  	  end
	  	end
	  return result
	end

	p total2(1, 10)
	p total2(1, 10){|num| num ** 2}

#有些对象有to_Proc方法，在方法中指定块时，如果以&对象的形式传递参数，对象.tp_Proc就会自动被调用，进而生成Proc对象。
	# Proc.new{|ary| arg.to_i}
	# %w(42 39 56).map{|i| i.to_i}
	# %w(42 39 56).map(&:to_i)
	# [Interger, String, Array, Hash, File, IO].sort_by(&:name)

#Proc的特征
	#虽然Proc可以作为匿名函数或方法使用，但它并不只是单纯的对象化。
	def counter
	  c = 0
	  Proc.new do 
	  	c += 1
	  end
	end

	#创建计数器c1并计数
	c1 = counter
	p c1.call
	p c1.call
	p c1.call

	#创建计数器c2并计数
	c2 = counter
	p c2.call
	p c2.call

	#再次用c1
	p c1.call

#Proc类的实例方法
	# prc.call(args, ^^^)
	# prc[args, ^^^]
	# prc.yield(args,^^^)
	# prc.(args, ^^^)
	# prc === arg  
	#以上对象都是Proc执行对象prc

#例子：从1-100 值为3的倍数输出Fizz，值为5的倍数输出Buzz，值为15的倍数输出Fizz Buzz
	fizz = proc{|n| n % 3 == 0 }
	buzz = proc{|n| n % 5 == 0 }
	fizzbuzz = proc{|n| n % 3 == 0 && n % 5 == 0}
	(1..100).each do |i|
	  case i
	  when fizzbuzz then puts "Fizz Buzz"
	  when fizz then puts "Fuzz"
	  when buzz then puts "Buzz"
	  else puts i
	  end
	end

#prc.arity 返回作为call方法的参数的块变量的个数。以|*args|的形式指定块变量时，返回-1

#prc.parameters 返回块变量的详细信息。返回值为[种类，变量名]形式的数组列表。
=begin
	---------------------------------------------
	|	符号			|			意义				|
	---------------------------------------------
	|	:opt 		| 可省略的变量					|
	---------------------------------------------
	|	:req 		| 必需的变量 					|
	---------------------------------------------
	| 	:rest 		| 以*args形式表示的变量 		|
	---------------------------------------------
	| 	:key 		| 关键字参数形式的变量 			|
	---------------------------------------------
	| 	:keyrest 	| 以**args形式表示的变量 		|
	---------------------------------------------
	| 	:block 		| 块 						|
	---------------------------------------------
=end

	prc0 = proc{ nil }
	prc1 = proc{|a| a}
	prc2 = lambda{|a, b| [a, b]}
	prc3 = lambda{|a, b=1, *c| [a, b, c]}
	prc4 = lambda{|a, &block| [a, block]}
	prc5 = lambda{|a: 1, **b| [a, b]}

	p prc0.parameters
	p prc1.parameters
	p prc2.parameters
	p prc3.parameters
	p prc4.parameters
	p prc5.parameters

#判断prc.lambda?是否为通过lambda定义的方法。
	prc1 = Proc.new{|a, b| a + b}
	p prc1.lambda?

	prc2 = lambda{|a, b| a +b}
	p prc2.lambda?

#prc.source_location 定义代码的位置
	prc0 = Proc.new{ nil }
	prc1 = Proc.new{|a| a}

	p prc0.source_location
	p prc1.source_location