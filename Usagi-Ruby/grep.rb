def simple_grep1(pattern, filename)	#定义方法
	file = File.open(filename)		#打开文件
	file.each_line do |line|		#逐行读取
		if pattern =~ line 			#条件验证 如果 检索数据 在 逐行读取 中 输出该行
			print line
		end
	end
	file.close						#关闭文件
end 