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
=end
