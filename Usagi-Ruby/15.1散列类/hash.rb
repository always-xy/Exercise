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