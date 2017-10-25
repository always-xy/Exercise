
# undef 用于删除已有的方法的定义
# undef 方法名   #直接使用方法名
# undef :方法名  #使用符号名



str1 = "Ruby"
str2 = "Ruby"

class << str1
  def hello
  	"Hello, #{self}!"
  end
end

p str1.hello            #=> Hello,Ruby
p str2.hello            #=> Error