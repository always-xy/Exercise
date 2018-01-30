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

=end
