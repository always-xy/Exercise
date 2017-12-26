class Point
  attr_reader :x, :y

  def initialize(x=0, y=0)
  	@x ,@y = x , y
  end

  def inspect #用于显示
  	"(#{x}, #{y})"
  end

  def +@ #返回自己
    dup
  end

  def -@ # x y 分别进行颠倒
  	self.class.new(-x, -y)
  end

  def ~@ # x y 使坐标反转90度
  	self.class.new(-y, x)
  end
end

point = Point.new(3, 6)

p +point
p -point
p ~point