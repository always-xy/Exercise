#由于IO类是File类的父类，因此在File类中可以使用IO类中文件操作方法。
=begin
文件的操作
  名称的变更、拷贝、删除等基本操作
目录的操作
  目录的引用、创建、删除等操作
属性的操作
  “只读“等文件属性的操作
=end

#变更文件名
#File.rename(before,after)
File.rename("before.txt", "after.txt")
#还可以移动文件到已经存在的目录下
File.rename("data.txt", "backup/data.txt") #File.name无法跨越系统或者驱动器移动文件。
#当文件不存在或者没有权限等异常时候，程序会抛出异常。

#复制文件
#只用一个Ruby预定义方法是无法复制文件的，可以利用File.open方法与write方法组合来实现文件复制。
def copy(from, to)
  File.open(from) do |input|
  	File.open(to, "w") do |output|
  	  output.write(input.read)
  	end
  end
end
#有一种更为便捷的方式来避免每次复制文件需要自定义。通过引用fileutils库，使用其中的FileUtils.cp和FileUtils.mv等方法来操作。
require "fileutils"
FileUtils.cp("data.txt", "backup/data.txt")
FileUtils.mv("data.txt", "backup/data.txt")
#File.rename不能实现跨文件系统、驱动器文件的移动。用FileUtils.mv方法则可以轻松实现。

#删除文件
File.delete(file)
File.unlink(file)
#可以使用File.delete方法删除文件
File.delete("too")

#Dir.pwd
#Dir.chdir(dir)
#程序可以获取运行时所在的目录，即当前目录。使用Dir.pwd方法获取当前目录。变更当前目录使用Dir.chdir方法
p Dir.pwd #例如当前目录返回/home/always-yx/Usagi-Ruby/18.1
Dir.chdir("ruby/2.4.1")
p Dir.pwd #/home/always-yx/Usagi-Ruby/18.1/ruby/2.4.1
Dir.chdir("/etc")

#可以直接打开文件名
=begin
p Dir.pwd
io = File.open("find.rb")
io.close

Dir.chdir("../../")
p Dir.pwd
io = File.open("指定目录")
io.close
=end

#目录内容的读取
#Dir.open(path)
#Dir.close
dir = Dir.open("/usr/bin")
while name = dir.read
  p name
end
dir.close

#也可以使用each方法
dir = Dir.open("/usr/bin")
dir.each do |name|
  p name
end
dir.close

#对Dir.open使用块后也可以省略close方法的调用，这时候程序会将生成的Dir对象传递给块变量
Dir.open("/usr/bin") do |dir|
  dir.each do |name|
  	p name
  end
end

#dir.read
#执行dir.read方法后，程序会遍历读取最线打开的目录下的内容。这里读取的内容可分为四类（1、表示当前。2、表示上级。3、其他目录。4、文件名）
def traverse(path)
  if File.directory?(path) #如果是目录
	dir = Dir.open(path)
	while name = dir.read
	  next if name == "."  # ×
	  next if name == ".." # ×
	  traverse(path + "/" name)
	end
	dir.close
  else
  	process_file(path)     #处理数据
  end
end
def process_file(path)
  puts path				   #输出结果
end

traverse(ARGV[0])

#Dir.glob
#使用Dir.glob方法后，就可以像shell那样使用*或者?等通配符（wildcard character)来取得文件名。Dir.glob方法将会匹配到的文件名。以数组的形式返回。
Dir.glob("*") #获取当前目录中所有的文件名。（无法获取Unix中以"."开始隐藏文件名。
Dir.glob(".*") #获取当前目录中所有隐藏文件名
Dir.glob(["*.html","*.htm"]) #获取当前目录中扩展名为html、htm后缀的文件。可多个指定
Dir.glob(%w(*.html,*.htm)) #模式中若没有空白，则用%w（……）生成字符串数组，会使程序更加易懂。
Dir.glob(["*/*.html","*/*.htm"]) #获取子目录下扩展名为html、htm后缀的文件。
Dir.glob("foo.[cho]") #获取文件名为foo.c\foo.h\foo.o的文件。
Dir.glob("**/*") #获取当前目录及子目录中所有的文件名，递归查找目录。
Dir.glob("foo/**/*.html") #获取目录foo及子目录中所有扩展名为.html的文件名。

#例子：可以像下面那样用Dir.glob方法改写代码清单18.1traverse方法。
def traverse(path)
  Dir.glob(["#{path}/**/*", "#{path}/**/.*"]).each do |name|
  	unless File.directory?(name)
  	  process_file(name)
  	end
  end
end