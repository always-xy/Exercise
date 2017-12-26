ltotal = 0											#统计行号
wtotal = 0											#统计单词
ctotal = 0											#统计字符
ARGV.each do |file|
  begin
  	input = File.open(file)							#打开文件
  	l = 0											#file内的行数
  	w = 0											#file内的单词数
  	c = 0											#file内的字符数
  	input =each_line do |line|
  	  l += 1
  	  c += line.size
  	  line.sub!(/^\s/, "")							#删除行首的空白符号
  	  ary = line.split(/\s+/)						#用空白符号分解
  	  w += ary.size
  	end
  	input.close										#关闭文件
  	printf("%8d %8d %8d %s\n", l, w, c, file)		#整理输出格式
  	ltotal = l
  	wtotal = w
  	ctotal = c
  rescue => ex
  	print ex.message, "\n"							#输出异常信息
  end
end
printf("%8d %8d %8d %s\n", ltotal, wtotal, ctotal, "total")
