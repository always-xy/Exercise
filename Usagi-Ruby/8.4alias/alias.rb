class C1						#定义C1
  def Hello 					#定义hello
  	"Hello"
  end
end

class C2 < C1                   #定义继承了C1的子类，C2
  alias old_hello hello         #设置别名old_hello  使用alias 别名 原名 （#直接使用方法名）/ alias :别名 :原名 （#使用符号名）
  def hello                     #重定义hello
 	"#{old_hello}, again"
  end
end

obj = C2.new
p obj.old_hello                 #=> Hello
p obj.hello                     #=> Hello,again
