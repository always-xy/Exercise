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