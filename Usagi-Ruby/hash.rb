#散列的创建
address = {:name => "高桥", :pinyin => "gaoqiao", :postal => "123456"}
address.each do |n|
	puts n
end
address ={name:"高桥", pinyin:"gaoqiao", postal:"123456"}
address.each do |n, m|
	puts "#{n}: #{m}"
end