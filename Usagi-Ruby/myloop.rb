def myloop
	while true
		yield
	end
end

num = 1						#初始化num数值
myloop do					
	puts "num is #{num}"	#输出num的数值
	break if num > 100		#判断条件，num大于100跳出
	num *= 2				#num乘以2
end 