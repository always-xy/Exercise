wday = {
  "sunday"    => "星期天",
  "monday"    => "星期一",
  "tuesday"   => "星期二",
  "wedensday" => "星期三",
  "thursday"  => "星期四",
  "friday"    => "星期五",
  "saturday"  => "星期六",
}

%w(sunday monday tuesday wedensday thursday friday saturday).each do |day|
  puts "“#{day}”是#{wday[day]}。"
end