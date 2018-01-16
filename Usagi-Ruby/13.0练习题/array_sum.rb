def sum_array(ary1, ary2)
  result = Array.new
  i = 0
  ary1.each do |elem1|
    result << elem1 + ary2[i]
    i+=1
  end
  return result
end

# 使用Array#zip方法的另外一种解法
def sum_array_zip(ary1, ary2)
  result = Array.new
  ary1.zip(ary2){|a, b| result << a + b }
  return result
end

p sum_array([1, 2, 3], [4, 6, 8])