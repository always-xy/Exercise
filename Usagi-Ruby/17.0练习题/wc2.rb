def reverse(input)
  open(input, "r+") do |f|
    lines = f.readlines
    f.rewind
    f.truncate(0)
    f.write lines.reverse.join()
  end
end

reverse(ARGV[0])
#接下来是输出第1行的内容，实际上只需稍微修改一下上面的程序即可实现。

def reverse(input)
  open(input, "r+") do |f|
    lines = f.readlines
    f.rewind
    f.truncate(0)
    f.write lines[0]
  end
end

reverse(ARGV[0])
#最后是输出最后一行的内容，这里稍微组合了一下（a）（b）的程序。

def reverse(input)
  open(input, "r+") do |f|
    lines = f.readlines
    f.rewind
    f.truncate(0)
    f.write lines.reverse[0]
  end
end

reverse(ARGV[0])