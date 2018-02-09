#获取HTML文件并进行简单的加工
#查找单词并显示其出现的次数
#强调查找结果并对输出结果进行加工

require "open-uri"
require "nkf"

url = "http://cruel.org/freeware/cathedral.html"
filename = "cathedral.html"

File.open(filename, "w") do |f|
  text = open(url).read
  f.write text
  #f.write NKF.nkf("-s", text)
end

htmlfile = "cathedral.html"
textfile = "cathedral.txt"

html = File.read(htmlfile)

File.open(textfile, "w") do |f|
  in_header = true
  html.each_line do |line|
	if in_header && /<a name="1">/ !~ line
  	  next
  	else
  	  in_header = false
  	end
  	break if /<a name="version">/ =~ line
  	f.write line
  end
end

#删除标签

require 'cgi/util'
htmlfile = "cathedral.html"
textfile = "cathedral.txt"

html = File.read(htmlfile)

File.open(textfile, "w") do |f|
  in_header = true
  html.each_line do |line|
  	if in_header && /<a name="1" >/ =~ line
  	  next
  	else
  	  in_header = false
  	end
  	break if /<a name="version">/ =~ line
  	line.gsub!(/<[^>]+>/, '')
  	esc_line = CGI.unescapeHTML(line)
  	f.write esc_line
  end
end

#扩展simple_grep显示次数
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]

File.open(filename) do |file|
  file.each_line do |line|
  	if pattern =~line
  	  print line
  	end
  end
end

#计算匹配行
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]

count = 0 
File.open(filename) do |file|
  file.each_line do |line|
  	if pattern =~ line
  	  line.scan(pattern) do |s|
  	  	count += 1
  	  end
  	  print line
  	end
  end
end
puts "count:#{count}"

#如果不需要逐行处理，单纯计算出现次数，则有更简单的实现方法。
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]

count = 0
File.read(filename).scan(pattern) do |s|
  count += 1
end
puts "count:#{count}"

#扩展simple_grep显示匹配部分
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]

count = 0
File.open(filemame) do |file|
  file.each_line do |line|
  	if pattern =~ line
  	  line.scan(pattern) do |s|
  	  	count += 1
  	  end
  	  print line.gsub(pattern){|str| "<<#{str}>>"}
  	end
  end
end
puts "count:#{count}"

#显示前后各10个字符
pattern = Regexp.new("(.{10})("+ARGV[0]+")(.{10})")
filename = ARGV[1]

count = 0
File.open(filename) do |line|
  file.each_line do |line|
  	file.scan(pattern) do |s|
  	  puts "#{s[0]}<<#{s[1]}>>#{s[2]}"
  	  count += 1
  	end
  end
end
puts "count:#{count}"

#匹配十个到零个字符
pattern = Regexp.new("(.{0, 10})("+ARGV[0]+")(.{0, 10})")
filename = ARGV[0]

count = 0

Filename.open(filename) do |file|
  file.each_line do |line|
  	line.scan(pattern) do |s|
  	  prefix_len = 0
  	  s[0].each_char do |ch|
  	  	if ch.ord < 128
  	  	  prefix_len += 1
  	  	else
  	  	  prefix_len += 2
  	  	end
  	  end
  	  space_len = 20 - prefix_len
  	  puts "#{" "*space_len}#{s[0]}<<#{s[1]}>>#{s[2]}"
  	  count += 1
  	end
  end
end
puts "count:#{count}"

#让前后的字符数可变更
len = ARGV[2].to_i
pattern = Regexp.new("(.{0,#{len}})("+ARGV[0]+")（.{0,#{len}}）")
filename = ARGV[1]

count = 0
File.open(filename) do |file|
  file.each_line do |line|
  	line.scan(pattern) do |s|
  	  prefix_len = 0
  	  s[0].each_char do |ch|
  	  	if ch.ord < 128
  	  	  prefix_len += 1
  	  	else
  	  	  prefix_len += 2
  	  	end
  	  end
  	  space_len = len * 2 - prefix_len
  	  puts "#{" " * space_len}#{s[0]}<<#{s[1]}>>#{s[2]}"
  	  count += 1
  	end
  end
end
puts "count:#{count}"