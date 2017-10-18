class HelloWorld 							#class关键字
  def initialize(myname = "Ruby")			#initialize方法，初始化对象处理写在这里
  	@name = myname							#初始化实例变量
  end

  def Hello 								#实例变量
  	puts "Hello, world. I am #{@name}"
  end
end

bob = HelloWorld.new("Bob")
alice = HelloWorld.new("Alice")
ruby = HelloWorld.new

ruby.hello
