#public   以实例方法的形式向外部公开
#private  在指定接收者的情况下不能调用该方法（只能使用缺省接收者的方式调用该方法，因此无法从实例的外部访问）
#protected在同一个类中时可将该方法作为实例方法调用

class AccTest
	def pub
		puts "pub is a public method"
	end

	public :pub #pub方设为public

	def priv
		puts "priv is a private method"
	end

	private :priv #priv设定为private
end

acc = AccTest.new
acc.pub
acc.priv