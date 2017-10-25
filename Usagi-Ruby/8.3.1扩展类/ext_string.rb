class String
  def count_word
  	ary = self.split(/\s+/) #用空格分割接收者
  	return ary.size			#返回分割后数组的元素的总数
  end
end

str = "Just Another Ruby Newbie"
p str.count_word            #=> 4


# (1) 在默认无参传入的时候 ，是以空格为间隔 ，获得数组
# [1] pry(main)> " now's the time".split
# => ["now's", "the", "time"]

# (2) 如果接受一个字符参数 ，那么会按照这个字符参数进行分割变成数组 
# [2] pry(main)> "mellow yellow".split("ello")
# => ["m", "w y", "w"]

# (3)如果接受的是两个参数 ，后面的参数是用来确定分割数组里面元素的个数，如果在按规则分割的时候 剩下多余的就变成一个元素
# [3] pry(main)> "mellow,yellow".split(//,4)
# => ["m", "e", "l", "low,yellow"]

# (4)当然split 参数 也接受正则表达式，如下 
# [4] pry(main)> "hi mom".split(%r{\s*})
# => ["h", "i", "m", "o", "m"]