# 创建数组
a = (1..100).to_a

# 取出ary中为3的倍数的元素
a3 = a.reject{|i| i % 3 != 0 }
p a3

# 另外，还有只返回符合条件的元素，不需要带!的select方法
a4 = a.select{|i| i % 3 == 0 }
p a4

# 删除ary中3的倍数以外的元素
a.reject!{|i| i % 3 != 0 }
p a