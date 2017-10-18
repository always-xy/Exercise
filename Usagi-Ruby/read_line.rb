filename = ARGV[0]				#进行赋值
file = File.open(filename)		#打开文件
file.each_line do |line|		#逐行读取 使用each_line方法
	print line 					#输出
end
file.close 						#关闭