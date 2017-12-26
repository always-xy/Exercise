hello = Proc.new do |name|
  puts "Helle, #{name}"
end

hello.call("World")
hello.call("Ruby")