#正则表示式用于过滤字符串。

#程序中正则表达式用\\包含起来。

#也可以使用regexp.new(str)创建。
=begin
  %r(模式)
  %r<模式>
  %r|模式|
  %r!模式!
=end

# 正则表达式 =～ 字符串 是常用方法。
=begin
 根据匹配结果执行不同的处理。

 if 正则表达式 =～ 字符串
   匹配时候处理
 else
   不匹配时候处理
 end

=end

#普通模式 /ABC/ = 字符串 只要含有ABC的字符串都会罗列出来
# ^ 表示匹配首行字符 $ 表示匹配尾行 \z 用语匹配尾行，如果末尾是换行符，则匹配前一个字符串。
#[ABC] 表示匹配ABC中的一个字符，用中括号包裹起来。一定范围内的，例如A-Z 用[A-Z] 表示。 [^ABC]表示除ABC以外的字符。
# . 为匹配任意字符串，站位 1 个字符位。
# \s 表示一个空格或者换页符\t
# \d 表示匹配0-9的数字
# \w 表示英文字母和数字
# \a 表示匹配字符串开头
# \z 表示匹配字符串末尾
# 单独的 \ 可作为转换符号，为特殊的字符串转换

#正则表达式中用元字符表示重复模式
# *......重复数0次以上
# +......重复数1次以上
# ?......重复数0次或1次

#最短匹配
# *?......0次以上的重复中最短的部分
# +?......1次以上的重复中最短的部分

#适当加入括号可以重复匹配更多的内容
#例子： /^(ABC)*$/

#可以加入条件表达式
#例子：/^(ABC|DFG)$/

#quote方法的正则表达式
re1 = Regexp.new("abc*def")
re2 = Regexp.new(Regexp.quote("abc*def"))
p (re1 =~ "abc*def")
p (re2 =~ "abc*def")

#正则表达式选项 使用方法，只需在/ /后面加上指定参数即可。
# i 忽略英文大小写。
# x 忽略正则表达式中的空白字符和#号，这样就可以在#后添加注释
# m 指定这个选项后就可以使用 . 匹配换行符
#还可以用Regexp.new方法中的第2个参数指定常量，例子:Regexp.new("Ruby脚本", Regexp::IGNORECASE | Regexp::MULTILINE)

#捕获（后向引用）通过 $ 符号获取字符值。例子：
/(.)(.)(.)/ =~ "abc"
first = $1
seconf = $2
third = $3
p first
p seconf
p third
#使用（？：）过滤不需要的捕获模式。例子：
/（.）(\d\d)+(.)/ =~ "123456"
p $1
p $2
p $3
/（.）(?:\d\d)+(.)/ =~ "123456"
p $1
p $2
#除了字符$外还有变量`、&、'分别代表匹配字符串的前部、中部、后部
/C./ =~ "ABCDEFG"
p $`
p $&
p $'

#字符串中有一些正则表达式方法 sub、gsub、scan方法
str = "abc def g hi"
p str.sub(/\s+/,'')
p str.gsub(/\s+/,'')
#sub方法只会替换abc\def间的空白、gsub则会替换全部空白。方法还可以用在块中
str = "rabcdeafg"
nstr = str.sub(/.a/) do |matched|
  '<'+matched.upcase+'>'
end
p nstr
nstr = str.gsub(/.a/) do |matched|
  '<'+matched.upcase+'>'
end
p nstr

#scan方法可以像gsub方法那样获取字符串，但是不能置换操作。
"abracatabra".scan(/.a/) do |matched|
  p matched
end
#正则表达式中使用（）会以数组的形式返回
"abracatabra".scan(/(.)(a)/) do |matched|
  p matched
end
#如果指定与()相等数量的块参数，则返回的不是数组，而是个数
"abracatabra".scan(/(.)(a)/) do |a, b|
  p a+"-"+b
end
#如果没有块，则返回匹配的字符串数组

#例子
str = "http://www.ruby-lang.org/ja/"
%r[http://([^/]*)/] =~ str
print "server address:", $1, "\n"
