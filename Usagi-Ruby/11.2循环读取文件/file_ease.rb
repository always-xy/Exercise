file = File.open("sample.txt")
file.each do |line|
  print line
end 
file.close