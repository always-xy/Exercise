class HelloCount
	@@count = 0                                #调用Hello的次数

	def HelloCount.count                       #读取调用次数的方法
		@@count
	end

	def initialize(myname="Ruby")
		@name = myname
	end

	def hello
		@@count += 1                           #累加调用次数
		puts "Hello, word。 I am #{@name}.\n"
	end
end

bob = HelloCount.new("BOb")
alice = HelloCount.new("Alice")
ruby = HelloCount.new

p HelloCount.count  # => 0
bob.hello
alice.hello
ruby.hello
p HelloCount.count  # => 3