def block_args_test
  yield()
  yield(1)
  yield(1, 2, 3)
end

puts "通过|a| 接收变量"
block_args_test do |a|
  p [a]
end
puts

puts "通过|a, b, c|接收块变量"
block_args_test do |a, b, c|
  p [a, b, c]
end
puts

puts "通过|*a|接收块变量"
block_args_test do |*a|
  p [a]
end
puts

hash = {a:100, b:200, c:300}
hash.each_with_index do |(key, value), index|
  p [key, value, index]
end