def copy(from, to)
  src = File.open(from)			#打开源文件
  begin
  	dst = File.open(to, "w")	#打开目标文件
  	data = src.read				#读取源文件
  	dst.write(data)				#写入目标文件
  	dst.close					#关闭目标文件
  ensure
  	src.close					#关闭源文件
  end
end