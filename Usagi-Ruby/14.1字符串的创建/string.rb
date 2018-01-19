#最简单的字符串创建方法是把字符串集合用“” 或者''扩起来
str = "我是字符串"
str = '我也什字符串'

#在字符串当中可以使用#{}扩起来ruby式子， 称为内嵌式表达式。
moji = "字符串"
str = "我是#{moji}"
p str

#使用%Q{}相当于"",使用%q相当于''

#使用\转义特殊字符串
=begin
-----------------------------------------------------------
|特殊字符串		|					意义
-----------------------------------------------------------
|\t				|			水平制表符
-----------------------------------------------------------
|\n				|			换行符号
-----------------------------------------------------------
|\r 			|			回车
-----------------------------------------------------------
|\f				|			换页
-----------------------------------------------------------
|\b 			|			退格
-----------------------------------------------------------
|\a 			|			响铃
-----------------------------------------------------------
|\e 			|			溢出
-----------------------------------------------------------
|\s 			|			空格								
-----------------------------------------------------------
|\v 			|			垂直制表符
-----------------------------------------------------------
|\nnn 			|			8进制表示方式
-----------------------------------------------------------
|\Xnn			|			16进制表示方式
-----------------------------------------------------------
|\Cx \C-x		|			Control + x
-----------------------------------------------------------
|\M-x			|			Meta(ALt) + x
-----------------------------------------------------------
|\M- \C-x		|			Meta(Alt) + Control + x
-----------------------------------------------------------
|\x 			|			表示x字符本身（x为除以上字符外的字符）
-----------------------------------------------------------
|\Unnnn 		|			Unicode字符的16进制表示方式
-----------------------------------------------------------
=end

#使用Here Document来创建字符串，具体使用符号用 << "" 双引号是标识符。结束使用EOF EOB表示
=begin
  
  <<"结束标识符"
  字符串内容
  结束标识符
	
=end

#example 结束表示符必须在首行，否则会报错
10.times do |i|
  10.times do |j|
  	print (<<"EOB")
i: #{i}
j: #{j}
i*j = #{i * j}
EOB
end
end

#example 使用<<-代替<< 程序会忽略标识符前空格和制表符号
10.times do |i|
  10.times do |j|
  	print (<<-"EOB")
  	i:#{i}
  	j:#{j}
  	i * j = #{i} * #{j}
  	EOB
  end
end

#example 赋值给变量时的方法如下
str = <<-EOB
Hello!
Hello!
Hello!
EOB
p str


#使用sprintf方法 参考专栏 prinf和sprintf
n = 123
printf("%d\n", n)
printf("%04d\n", n)
printf("%+d\n", n) #printf方法可以按照某种指定格式输出字符串

sprintf("%d", 123) #sprintf方法把内容输出成字符串，开头的S是string单词的缩写

#使用`` 通过`命令`可以得到命令标准输出并将其转换为字符串对象
#example
`ls -l /etc/hosts`

#获取字符串的长度使用length 和 size方法
p "Hello Ruby".length
p "Hello Ruby".size

p "我是中文".length #中文返回字符数
p "我是中文".bytesize #使用bytesize返回字节数
p "".empty? #empty验证字符串是否为空

#字符串的索引
str = "全新的String字符串"
 p str[3]
 p str[2,6]

#字符串的连接
Hello = "Hello"
Word = "Word"
p Hello + Word
p Hello << Word
p Hello.concat(Word) #<<和concat会改变原有对象的数值

#字符串比较 使用==或者!=来判断
p "aaa" == "bbb"
p "aaa" != "bbb"
p ("aaaaa" < "b") #此时会返回ture字符串的大小比不是字符串的长度决定的，按照编码的顺序排列。

#字符串的分割
str = "高桥:gaoqiao:1234567:000-123-4567"
cloumn = str.split(/:/) #以以特定的手法分割字符串赋值给cloumn
p cloumn

#换行符的使用 chop方法和chop！方法会删除字符串尾部的任何字符。chomp和chomp!会删除行末的换行符
str = "abcde"
newstr = str.chop
p newstr
newstr = str.chomp
p newstr
=begin
chomp!的典型用法，在处理文本时候会选择破坏性的chomp！，作用是直接删除换行符。
  f.each_line do |line|
  	line.chomp!
  	处理line
  end
=end

#字符串的检索 使用 index和rindex来进行查找指定的字符串是不是在字符串对象中 rindex开的r什right的意思。
str = "abbbbbbb"
p str.index("bb")
p str.rindex("bb") #找到时候返回索引值，没找到返回nil

#如果想知道字符串中是否有参数指定的字符串，用include?方法
str = "abbbbbb"
p str.include?("bb")

#字符串的置换 使用sub和gsub

#字符串和数组的共同方法，字符串继承了Object类的实例方法。

#数组的索引方法野同样适合字符串
str = "abcde"
str[2, 1] = "C"
p str

str = "Hello, Ruby."
p str.slice!(-1)
p str.slice!(5..6)
p str.slice!(0, 5)
p str


#返回Enumerator对象方法
#用collect方法处理each_line方法获取的行
str = "壹\n贰\n叁\n"
tmp = str.each_line.collect do |line|
  line.chomp * 3
end
p tmp

#用collect方法处理用each_byte方法获取的数值
str = "abcde"
tmp = str.each_byte.collect do |byte|
  -byte
end
p tmp


#专栏 Enumerator类
=begin
虽然Enumerable模块定义很多方法，但是作为模块方法的基础，将遍历元素的方法限定
为each方法，有些不太灵活。
String对象有each_line\each_byte\each_char等用于循环的方法，如果这些方法
都能使用each_with_index\collect等Enumerable模块的方法的话，那就很方便。
而Enumerator类就是为了解决这个问题而诞生。
Enumerator类能以each方法以外的方法为基础，执行Enumerable模块定义的方法。使
用Enumerator方法就可以用String#each_line方法代替each方法，从而执行Enumerable
模块的方法了。
=end
str = "AA\nBB\nCC\n"
p str.each_line.class
p str.each_line.map{|line| line.chop}
p str.each_byte.reject{|c| c == 0xca}

#与连接、反转（reverse)相关的方法
#与数组一样，字符串也能使用concat方法和+ 连接符
s = "欢迎"
s.concat("光临")
p s

s = "防/止/检/索"
p s.delete("/")

s = "晚上好"
p s.reverse

#s.strip删除字符串s前后空白字符的方法
p " Think,You ".strip

#upcase会将小写字母转换成大写，原有大写字母保持不变
p "think,You".upcase

#downcase将大写字母转换成小写
p "Think,YOU".downcase

#swapcase将大写字母转换成小写，小写字母转换成大写
p "tHink, yOu".swapcase

#capitalize将首字母转换成大写，其余转换成小写
p "think,YOU".capitalize

#tr方法源于unix的tr命令,可以置换多个字符
p "ABCDE".tr("B","b")
p "ABCDE".tr("BD","bd")
p "ABCDE".tr("A-E","a-e")
