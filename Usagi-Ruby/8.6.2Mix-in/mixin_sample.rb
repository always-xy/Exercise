module MyModule
  #共通方法
end

class Myclass1
  #myclass1独有的方法
  include MyModule
  #方法代码
end

class Myclass2
  #myclass2独有方法
  include MyModule
  #方法
end
