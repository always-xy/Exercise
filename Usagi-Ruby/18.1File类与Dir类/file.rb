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

#目录的删除和创建
Dir.mkdir(path)# 创建新目录用Dir.mkdir方法。
Dir.mkdir("temp")
Dir.rmdir(path)# 删除目录用Dir.rmdir方法。
Dir.rmdir("temp")

#文件与目录的属性
=begin
  文件与目录都有属性，例如时间戳、大小、所有者等。
  File.stat（path）方法可以获取文件、目录的属性。File.stat返回的是File::stat类的实例，如下。
  ---------------------------------------
  |	dev		| 文件系统的编号				|
  ---------------------------------------
  |	ino		| i-node编号					|
  ---------------------------------------
  | mode	| 文件的属性 					|
  ---------------------------------------
  | nlink	| 链接数 						|
  ---------------------------------------
  | uid 	| 文件所有者用户的ID 			|
  ---------------------------------------
  | gid		| 文件所有组的ID				|
  ---------------------------------------
  | rdev 	| 文件系统的块大小				|
  ---------------------------------------
  | size	| 文件大小 					|
  ---------------------------------------
  | blksize | 文件系统的块大小				|
  ---------------------------------------
  | blocks  | 文件占用的块数量 			|
  ---------------------------------------
  | atime 	| 文件最后的访问时间			|
  ---------------------------------------
  | mtime 	| 文件最后的修改时间 			|
  ---------------------------------------
  | ctime 	| 文件最后状态的的更改时间 		|
  ---------------------------------------
  其中除了atime\mtime\ctime方法返回Time对象外，其他方法都是返回的整数值。
  通过uid、gid方法获取对应的用户ID和组ID时，需要用到ETC模块，通过 require 'etc' 引用。

  require 'etc'

  st = File.stat("/usr/local/bin/ruby")
  pw = Etc.getpwuid(st.uid)
  p pw.name
  gr = Etc.getgrgid(st.gid)
  p gr.name

  File.ctime(path)
  File.mtime(path)
  File.atime(path)
  这三个方法与实例方法File::Stat#ctime\File::Stat#atime\File::Stat#mtime是一样的如果同时使用两个以上方法用下面的会更有效率/
  File.utime(atime,mtime,path)

  filename = "foo"
  File.open(filename, "w").close #创建文件后关闭

  st = File.stat(filename)
  p st.ctime
  p st.atime
  p st.mtime

  File.utime(Time.now - 100, Time.now - 100, filename)
  st = File.stat(filename)
  p st.ctime
  p st.atime
  p st.mtime

  #File.chmod(mode, path) 修改文件path的访问权限，mode的值为整数，同时可以访问多个路径。

   ------------所有者的读取权限
  |------------所有者的写入权限
  ||-----------所有者的执行权限
  |||	 ------所属组的权限
  |||	 |	   ----其他用户访问的权限
  |||	 |	   |
  111	111	  111
  举例：设定所有者的权限为读写，其他用户为只读。 数值为 110100100。由于8进制刚好什用1个数字表示3位，因此一般会将权限位用8进制表示。
  File.chmod(0644, "test.txt")

  #可以追加权限，然后在计算后的新值重新设定。
  rb_file = "text.rb"
  st = File.stat(rb_file)
  File.chmod(st.mode) | 0111, rb_file) #追加执行权限

  File.chown(owner, groud, path) #改变文件path所有者，owner表示新的所有者用户ID，group表示新的所属组ID。
  
  #FileTest模块中的方法用于检查文件的属性，该模块可以在include后使用，也可以直接作为模块函数使用。
  FileTest模块方法
  --------------------------------------------------------------------
  |	exist?(path)	|	path若存在则返回true							 |
  --------------------------------------------------------------------
  |	file?(path)		|	path若存在则返回true							 |
  --------------------------------------------------------------------
  |	directory?(path)|	path若是目录则返回true							 |
  --------------------------------------------------------------------
  |	owned?(path)	|	path的所有者与执行用户一样则返回true				 |
  --------------------------------------------------------------------
  |	grpowned?(path) |	path的所属组与执行用户所属组一样则返回true			 |
  --------------------------------------------------------------------
  |	readable?(path) |	path可读返回true								 |
  --------------------------------------------------------------------
  |	writable?(path) |	path可写返回true								 |
  --------------------------------------------------------------------
  | executable?(path)|	path执行则返回true 							 |
  --------------------------------------------------------------------
  |	size(path)		|	返回path的大小								 |
  --------------------------------------------------------------------
  |	size?(path)		|	path大小比0大时返回true，比0小返回nil			 |
  --------------------------------------------------------------------
  |	zero?(path)		|	path的大小为0时返回true						 |
  --------------------------------------------------------------------

  #文件名的操作
  File.basename(path[,suffix])返回路径path最后一个“/”以后的部分，如果指定了扩展名suffi，则会去除返回值中扩展名的部分。在路径中获取文件名使用该方法。
  p File.basename("/usr/local/bin/ruby")
  p File.basename("/src/ruby/file.c", ".c")
  p File.basename("file.c")

  #File.dirname(path)返回路径path中最后一个“/”之前的内容，路径不包含“/”时返回“。”，在从路径中获取目录名时使用该方法。
  p File.dirname("/usr/local/bin/ruby")
  p File.dirname("ruby")
  p File.dirname("/")

  #File.extname(path)返回路径path中basename的扩展名，在从路径中获取扩展名则使用该方法。
  P File.extname("/usr/local/bin/ruby.rb")
  p File.extname("ruby-2.4.1-p0.tar.gz")
  p File.extname("/usr/local/bin/ruby")
  p File.exrname("~/.zshrc")

  #File.split(path)将路径path分割为目录与文件两部分，并以数组形式返回。在知道返回值的数量时，使用多重赋值会很方便。
  p File.split("/usr/local/bin/ruby")
  p File.split("ruby")
  p File.split("/")
  dir, base = File.split("/usr/local/bin/ruby")

  #File.join(name1[name2,^^^])用File::SEPARATOR连接参数指定的字符串，默认值为”/“
  p File.join("/usr/bin/", "ruby")
  p File.join(".", "ruby")

  #File_expand_path(path[,default_dir])根据目录名default_dir,将相对路径转化为绝对路径。不指定default_dir时根据当前目录转换。
  p Dir.pwd
  p File.expand_path("bin")
  p FIle.expand_path("../bin")
  在unix中可以用”～“用户名的形式获取用户主目录。
  p File.expand_path("~gotoyuzo/bin")

  #与操作文件相关的库
  find库中的find模块被用于对指定的目录下的目录或文件做递归处理。
  Find.find(dir){|path|^^^} find方法会将目录下dir下所有文件路径逐个传递给path
  Find.prune 在使用Find.find时候调用，Find.prune方法，程序会跳过当前查找目录下的所有路径。（使用next时会跳过当前目录，但是子目录依然会查找。）

  #代码实例：
  require 'find'  

  IGNPORES = [/^\./, /^CVsS$/, /^RCS$/]
  def listdir(top)
  	Find.find(top) do |path|
  	  if FileText.directory?(path)     #如果path是目录
  	  	dir, base = File.split(path)
  	  	IGNORES.each do |re|
  	  	  if re =~ base 			   #需要忽略的目录
  	  	  	Find.prune 				   #忽略该目录下的内容查找
  	  	  end
  	  	end
  	  	puts path 					   #输出结果
  	  end
  	end
  end

  listdir(ARGV[0])

  #tempfile库 用于管理临时文件，在处理大量的输出时候，有时候会将需要的数据写进临时文件。且在程序执行完毕后不再需要，因此必须删除。
  #Tempfile.new(basename[,tempdir]) 创建临时文件，实际生成的文件名格式为：basename + 进程ID + 流水号。因此即使是同样的basename，每次调用生成文件也是不一样的。
  #如果不指定tempdir,则会按照顺序查找ENV['TMPDIR']\ENV['TMP']\ENV['TEMP']\/TMP,并把最先找到的路径作为临时目录使用。
  
  #tempfile.close(real) 关闭临时文件，real为ture时则马上删除临时文件。即使没有明确指定删除，tempfile对象也会在GC的时候一并删除。real的值默认为false.

  #tempfile.open 再次打开close方法关闭的临时文件。

  #tempfile.path 返回临时文件的路径。
  
=end