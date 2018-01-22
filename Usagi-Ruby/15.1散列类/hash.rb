#复习散列
person = Array.new
person[0] = "田中一郎"
person[1] = "佐藤次郎"
person[2] = "木村三郎"
p person

person = Hash.new
person["tanaka"] = "田中一郎"
person["satou"] = "佐藤次郎"
person["kimura"] = "木村三郎"
p person

#散列的创建
h1 = {"a"=>"b", "c"=>"d"}
p h1

h2 ={a:"b", c:"d"}
p h2

h3 = Hash.new
p h3

h = Hash.new
h["R"] = "Ruby"
p h["R"]

#还可以使用store方法设定值，使用fetch方法设定获取值
h = Hash.new
h.store("R", "Ruby")
p h.fetch("R") #使用fetch时候注意，如果散列中没有要查找的数值，程序就会抛出错误。对fetch指定两个参数，如果健不存在，则该参数会变为默认值。

h = Hash.new
p h.fetch("N"){String.new} #fetch可以使用块

#一次性获取所有的健、值
=begin
-------------------------------------------------
|	获取健	|	keys	|	each_key{|健|……}		|
-------------------------------------------------
|	获取值	|	value	|	each_value{|值|……}	|
-------------------------------------------------
|获取健值对[健，值]|to_a	|	each{|健，值|……}		|
|				|		|	each{|数组|……}		|
-------------------------------------------------
=end

h = {"a" => "b", "c" => "d"}
p h.keys
p h.values
p h.to_a

#散列的默认值
h = Hash.new(11)
h["a"] = 10
p h["a"]
p h["b"]

h = Hash.new do |hash, key| #指定散列的默认值，确不唯一性。
  hash[key] = key.upcase 
end
h["a"] = "b"
p h["a"]
p h["x"]
p h["y"]

h = Hash.new do |hash, key|
  hash[key] = key.upcase
end
p h.fetch("x","(undef)") #fetch方法的第二个参数指定的优先级是最高的。

#查看指定对象是否为散列的健或值
h = {"a" => "b", "c" => "d"}
p h.key?("a")
p h.has_key?("a")
p h.include?("z")
p h.member?("z")
#查看散列的值是否存在
h = {"a" => "b", "c" => "d"}
p h.value?("b")
p h.has_value?("d")

#查看散列大小
h = {"a" => "b", "c" => "d"}
p h.size
p h.length

p h.empty? #查看散列大小是否为0
h2 = Hash.new
p h2.empty?

#删除键值
h = {"a" => "b", "c" => "d"}
p h.delete("a")
p h
p h.delete("a"){|key| "no key #{key}."}
#delete_if用法
p h.delete_if{|key, value| key == "a"}
p h.reject!{|key, value| key == "a"} #reject! 和delete方法相同，返回值不同

#初始化散列
h = {"a" => "b", "c" => "d"}
h.clear #使用clear方法清空散列，会清空继承对象内容
#h.Hash.new #创建新的散列覆盖，不会清空对象内容