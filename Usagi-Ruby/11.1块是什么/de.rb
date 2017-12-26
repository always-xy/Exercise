ary = ["a", "b", "c"]
ary.each do |i|
 puts i
end

ary.each_with_index {|obj, idx|
 p [obj, idx]
}