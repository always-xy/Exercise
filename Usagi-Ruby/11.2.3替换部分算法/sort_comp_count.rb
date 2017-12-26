ary = %w(Ruby is open source programming language with a focus on simplicity and productivity. It has an elegant sytax that is natural to read and easy to write)

call_num = 0
sorted = ary.sort do |a, b|
  call_num += 1
  a.length <=> b.length
end

puts "排列结果#{sorted}"
puts "数组的元素数量#{ary.size}"
puts "调用块的次数#{call_num}"


ary2 = %w(Ruby is open source programming language with a focus on simplicity and productivity. It has an elegant sytax that is natural to read and easy to write)
sorted2 = ary2.sort_by{ |item| item_length}
p sorted2