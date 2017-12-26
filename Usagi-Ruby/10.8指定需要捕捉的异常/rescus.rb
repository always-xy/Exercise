file1 = ARGV[0]
file2 = ARGV[1]
begin
  io = File.open(file1)
rescue Errno::ENOENT, Errno::EACCES
  io = File.open(file2)
rescue
  puts "文件打开错误"
end