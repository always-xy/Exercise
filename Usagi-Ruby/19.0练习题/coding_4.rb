# encoding: utf-8

Dir.glob("*.txt") do |filename|
  ## 将UTF8-MAC编码的文件名转换为UTF-8编码后，就可以与UTF-8编码的字符串“ルビー.txt”进行比较
  if filename.encode("UTF8-MAC").encode("UTF-8") == "ルビー.txt"
    puts "found."; exit
  end
end
puts "not found."