#华氏=摄氏×9%5+32
def cels2fahr(cels)
  return cels * 9.0 / 5.0 + 32.0
end

#摄氏度=（华氏-32）×5%9
def fahr2cels(fahr)
  return (fahr.to_f - 32) * 5.0 / 9.0
end
#从1到100递增循环
1.upto(100) do |i|
  print i, " ", fahr2cels(i), "\n"
end

#1-6之间随机数
def dice
  return rand(6) + 1
end

#10次1-6之间的随机数
def dice10
  ret = 0
  10.times do
    ret += dice
  end
  ret
end

def prime?(num)
  return false if num < 2
  2.upto(Math.sqrt(num)) do |i|
    if num % i == 0
      return false
    end
  end
  return true
end
