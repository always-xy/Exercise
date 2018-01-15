#根据某些条件从数组中删除数据
a.compact  #返回新的数组
a.compact! #直接替换原来数组,compact!方法是删除nil元素后的a，但是什么都没有删除的情况下会返回nil

a.delete(x)#从数组a中删除x元素

a.delete_at(n)#从数组a中删除指定的索引对象。

a.delect_if{|item|条件}  如果块为真，则从数组a中删除item，delete_if具有破坏性的。
#reject!方法具有破坏性
a.reject{|item|条件}
a.reject!{|item|条件}

#slice删除数组a中指定的值，slice!同样据有破坏性质
a.slice!(n)
a.slice!(n..m)
a.slice!(n,len)

#uniq删除数组中重复的数值,uniq!方法具有破坏性
a.uniq

#shift删除数组开头的元素
a.shift删除数组开头的元素

#pop删除数组结尾的元素
a.pop