sum = 0
outcome = {"参加费" => 1000, "挂件费用"=>1000, "联欢费用"=>4000}
outcome.each do |pair|
  sum += pair[1]
end

puts "合计:#{sum}"


sum2 = 0
outcome2 = {"参加费"=>1000, "挂件费用"=>1000, "联欢费用"=>4000}
outcome2.each do |item, price|
  sum2 += price
end

puts "合计费用:#{sum2}"