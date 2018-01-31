#标准输出和输入
$stdout.print "Output to $stdout.\n" #标准输出
$stderr.print "Output to $stderr.\n" #标准错误输出

#可以使用tty?方法判断，程序是否与控制台相关联
if $stdin.tty?
  print "stdin is tty.\n"
else
  print "stdin is not tty.\n"
end

#使用IO = File.open(file, mode)/ IO = open(file, mode)方法可以打开文件，mode为打开文件的模式，省略状态下为只读。各模式下加上b、通过rb\rb+等形式表示二进制模式
#使用io.close方法可以关闭文件，File.open方法如果使用块可以自动关闭文件。
#使用io.close?方法可以检测文件是否关闭。
#File.read(file)可以一次性读取文件。

#输入/输出操作的数据作为字符串，执行输出操作后，会从头到尾按顺序读取数据，执行输出操作后，则会按写入顺序不断追加数据。
=begin
io.gets(rs)
io.each(rs)
io.each_line(rs)
io.readlines(rs)

从io获取的对象读取一行数据，用参数rs的字符串分行，。省略rs时则用预订义变量$/(默认值为\n)
方法返回的字符串包含末尾的换行符，用chmop!方法可以很方便的删除字符串末尾的换行符。
输入完再次获取新数值后，gets方法会返回nil，另外还可以通过eof?方法检查输入是否已经完毕。
while line = io.gets
  line.chomp!
  #条件处理
end
p io.eof?

while条件表达式中同时进行了变量赋值与条件判断的操作。将gets方法的返回值复制给line，并将值作为while判断。
用each_line方法也可以到达同样的效果。
io.each_line do |line|
  line.chomp!
  #条件处理
end
用readslines方法可以一次性读取所有数据，并返回将每行数据作为元素封装的数组。
ary = io.readlines
ary.each_line do |line|
  line.chomp!
  #条件判断
end

gets、each_line方法会逐行读取数据，并且自动记录行数，通过lineno方法获取，此外lineno=方法可以改变这个值
，但是值的改变并不会对文件指针有影响。

#读取文本并 在文件首行添加行号
$stdin.each_line do |line|
  printf("%3d %s", $stdin.lineno, line)
end

#io.each_char 逐个读取IO中的数据并执行块，将得到的字符（String对象）作为块变量传递。
io.each_line do |ch|
  #对line进行操作
end

#io.each_byte对逐个字节进行操作,并启动块。
#io.getc值读取io中的一个字符，根据文件编码不同，有时一个字符会由多个字节组成，但这个方法只会读取一个字符，
然后返回字符串对象，数据全部读取完成后再读取时会返回nil。
while ch = io.getc
  #对ch进行操作
end

#io.ungetc 将参数ch指定的字符返回到io的输入缓冲中。
#hello.txt中内容为Hello,Ruby.\n
File.open("hello.txt") do |io|
  p io.getc
  io.ungetc
  p io.gets
end

#io.getbyte 只读取io中的一个字节，返回得到的字符转换为ASCII码后的整数对象。数据全部读取完成后会返回nil。

#io.ungetbyte(byte) 将参数byte指定的一个字节退回到输入缓冲中，参数为整数时，将该整数除以256后的余数作为ASCII码
字符返回一个字节，参数为字符串时，只返回字符串的第一个字节。

#io.read(size) 读取参数size指定的大小的数据，不指定大小时，则一次性读取全部数据并返回。
File.open("hello.txt") do |io|
  p io.read(5)
  p io.read
end

#输出操作
#io.puts(str0,str1^^^)对字符串末尾添加换行符后输出,指定多个参数时，会分别添加换行符。如果参数为String,
会自动调用to_s方法，将其转换为字符串后再输出。
#$stdout.puts "foo","bar","baz"

#io.puts(ch)输出参数ch指定的字符编码对应的字符，参数为字符串时输出首字符。
#$stdout.putc(82)
#$stdout.putc("Ruby")
#$stdout.puts("\n")

#io.print(str0,str1^^^)
输出参数指定的字符串，参数可指定多个字符串，参数为String以外的对象时对象会自动为其转换类型为字符串。
#io.printf(fmt,arg0,arg1^^^)
按照指定格式输出字符串，格式fmt的用法与printf方法一样。
#io.write(str)
输出参数str指定的字符串，参数为string以外的对象时会自动为其转换为字符串类型。
size = $stdout.write("Hello.\n")
p size
#io<<str
输出参数str指定的字符串。<<会返回接收者本身，可以像下面写。
io << "foo" << "bar" << "baz"

#文件指针的作用就是把文件分成固定的块保存，方便直接访问某个块的数据。我们文件指针（file pointer）
或者当前文件偏移量（current file offset）来表示IO对象指向的文件位置。每当读取文件时，文件指针会自动偏移。

#io.pos(position)
通过pos方法可以获得文件指针现在的位置，改变文件指针的位置用pos=方法。
File.open("hello.txt") do |io|
  p io.read(5)
  p io.pos
  io.pos = 0
  p io.gets
end

#io.seek(offset,whence)
移动文件指针的方法，参数offset为用于指定指针的整数，参数whence用于指定offset如何移动。
---------------------------------------------------------------------
|		whence		|		意义										|
---------------------------------------------------------------------
|	IO::SEEK_SET	|	将文件指针移动到offset指定位置					|
---------------------------------------------------------------------
|	IO::SEEK_CUR	|	将offset视为相对于当前位置的偏移位置来移动文件指针	|	
---------------------------------------------------------------------
|	IO::SEEK_END	|	将offset指定为相对于文件末尾的偏移位置			|
---------------------------------------------------------------------

#io.rewind
将文件指针返回到文件的开头。lineco方法返回的行编号为0.
File.open("hello.txt") do |io|
  p io.gets
  io.rewind
  p io.gets
end

#io.truncate(size)
按照参数size指定的大小截断文件
io.truncate(0) #将文件大小置为0
io.truncate(io.pos) #删除当前文件指针以后的数据。

#为了保证各个平台换行符的兼容性，会将字符串中的“\n”转换为当前的换行符并输出。因此在读取的时候也会将实际的换行符转为\n
#打开文件并输出1行数据
io = File.open("text.txt", "w+")
io.print("Hello, world.\n")
#为了读取输出的行
#返回到文件开头
io.rewind
#读取文件
p io.gets

#io.binmode
新的IO对象默认是文本模式，使用binmode方法可将其改变为二进制模式。
File.open("foo.txt","w") do |io|
  io.binmode
  io.write "Hello,world.\n"
end
#这样就可以不用换行符，又能得到与文本一模一样的数据。不过转换为二进制的数据无法转为文本模式。
=end

#标准输出和标准错误输出，标准输出有缓冲机制名，当缓冲累积一定量的数据后，就会实际输出处理并清除缓冲。标准错误输出则直接输出。
$stdout.print "out1"
$stderr.print "err1"
$stdout.print "out2"
$stdout.print "out3"
$stderr.print "err2\n"
$stdout.print "out4\n"
#io.flush强制输出缓冲数据。
#io.sync=(state)用过设置io.sync = true 程序写入缓冲时flush方法就会自动调用
$stdout.sync = true #同步输出处理。
$stdout.print "out1"
$stderr.print "err1"
$stdout.print "out2"
$stdout.print "out3"
$stderr.print "err2\n"
$stdout.print "out4\n"

#io.popen方法可以与其他命令进行数据交换处理。
#IO.popen(command,mode) 的使用方法与file.open方法一样，参数缺省时默认为"r"模式。
#例子：gunzip命令解压处理扩展名为.gz的文件
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]
if /.gz$/ =~ filename
  file = IO.popen("gubzip -c" #{filename})
else
  file = File.open(filename)
end
file.each_line do |text|
  if pattern =~ text
  	print text
  end
end

#open("|command",mode) 将带有管道符号的命令传递给open方法的效果与使用IO.popen方法什一样的。
filename = ARGV[]
open(|"|gunzip -c #{filename}") do |io|
  io.each_line do |line|
  	print line
  end
end

#open.uri库 
#除了控制台、文件以外，进程间通信时使用的管道（pipe）、网络间通信时使用的套接字（socket）也可以作为IO对象使用，
#通过require引用open-uri库后，我们就可以像打开普通文件一样打开HTTP、FTP的URL，使用open-uri库功能时候，不要
#使用File.open方法，只使用open方法即可。
require "open-uri"
#通过HTTP读取数据
open("http://www.ruby-lang.org") do |li|
  puts io.read #Ruby的官方网页输出到控制台
end

#通过FTP读取数据
url = "ftp://www.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz"
open(url) do |li|
  open("ruby-2.0.0-p0.tar.gz", "w") do |f| #打开本地文件
    f.write(io.read)
  end
end

#可以根据状态改变应答内容
require "open-uri"
options = {
	"Accept-Language" => "zh-cn, en;q=0.5",
}
open("http://www.ruby-lang.org",options){|io|
  puts io.read
}

#stringio库
#stringIO就是用于模拟IO对象的对象，通过require引用stringio库后，就可以使用stringio对象。
require "Stringio"

io = StringIO.new
io.puts("A")
io.puts("B")
io.puts("C")
io.rewind
p io.read

#StringIO对象还有另外一种用法，将字符串当作io数据处理，将大数据保存在文件中，并将小数据直接传输给别处理时。
require "stringio"

io = StringIO.new("A\nB\nC\n")
p io.gets
p io.gets
p io.gets