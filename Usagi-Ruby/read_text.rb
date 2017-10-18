filename = ARGV[0]          #文件对象赋值给变量
file = File.open(filename)  #打开文件对象
text = file.read            #读取文件对象
print text                  #把作为参数传过来的字符串，通过Print方法显示出来。
file.close                  #关闭文件