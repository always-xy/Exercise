#检查文件是否存在
# p namespace.exist? (文件路径)
# #文件大小
# p namespace.size （文件路径）

#如果没有定义与模块内方法名、常量等同名的名称，那么引用时就可以省略模块名。通过
#include可以把模块内的方法名、常量名合并到当前的命名空间。

#圆周率(常量)
p Math::PI
#2的平方根
p Math.sqrt(2)

include Math
p PI
p sqrt(2)