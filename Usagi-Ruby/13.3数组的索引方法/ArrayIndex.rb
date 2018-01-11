#获取数组元素
a[n] 	 #获取第n位数组
a[n..m]  #从n位置到m位置之间的数组
a[n,len] #从n位置开始到len指定长度

#元素赋值
a[n] = item		  #单个赋值
a[n..m] = [n..m]  #多个赋值
a[n, m] = [n, m]  #在n位置前插入n、m的值
a.values_at(n, m, l) #分散获取n\m\l位置的数组