# sort排列的默认按照先大写后小写，比较后返回 -1 0 1 （《 = 》）其中一个。
array = ["ruby", "Perl", "PHP", "python"]
sorted = array.sort
p sorted

array = ["ruby", "Perl", "PHP", "python"]
sorted = array.sort{|a, b| a <=> b}
p sorted

array = ["ruby", "Perl", "PHP", "python"]
sorted = array.sort{|a, b| a.length <=> b.length}
p sorted