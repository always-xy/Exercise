file = ARGV[0]
begin
  io =File.open(file)			#打开文件
rescue
  sleep 10						#每隔十秒打开一次
  retry							#如果遇到异常会重复执行begin部分，慎用，因为会使程序陷入死循环
end

data = io.read
io.close