tags = ["A", "IMG", "PRE"]
tags.each do |tagname|
	case tagname
	when "P","A","w","BLOCKQUOTS" then
		puts "#{tagname} has child"
	when "IMG", "WEW", "SDSW", "AWQ", "1" then
		puts "#{tagname} has no child"
	else
	 	puts "#{tagname} cannot be used"
	end
end

10.times { |i| puts "第#{i}次输出"}