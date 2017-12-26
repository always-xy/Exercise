class RingArray < Array   #指定父级
  def [] (i)              #重定义运算符
  	idx = i % size        #计算新索引数值
  	super(idx)            #调用父类中同名的方法
  end
end

wday = RingArray["日", "月", "嚒", "教", "杨", "小", "阿", "颖"]
p wday[6]
p wday[12]
p wday[17]
p wday[-2]