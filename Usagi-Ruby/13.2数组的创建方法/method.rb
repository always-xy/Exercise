#Ruby允许使用任意字符来包含数组

#数组的创建方法，直接赋值即可
nums = [1, 2, 3, 4, 5]
strs = ["a", "b", "c", "d", "e"]

#创建类的实例使用的new方法，数组也同样可以使用
a = Array.new
p a
a = Array.new(5)
p a
a = Array.new(5, 0)
p a


#使用%w可以不包含空白字符串数组
lang = %w(Ruby Perl Python Scheme Pike REBOL)
p lang

#使用%i可以创建符号类数组
lang = %i(Ruby Perl Python Scheme Pike REBOL)

#使用to_a可以把类的对象转换为数组,在把散列放到一个大的数组中，这样更利于阅读
color_table = {black: "#000000", white:"#FFFFFF"}
p color_table.to_a

#使用split()方法可以创建数组
column = "2013/05/30 22:33 foo.html proxy.example.jp ruby,rb".split()
p column