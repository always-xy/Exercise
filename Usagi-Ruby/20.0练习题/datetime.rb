def cparsedate(str)
  now = Time.now
  year = now.year
  month = now.month
  day = now.day
  hour = now.hour
  min = now.min
  sec = now.sec 
  str.scan(/(上午|下午)?(\d+)(年|月|日|点|分|秒)/) do
    case $3
    when "年"
      year = $2.to_i
    when "月"
      month = $2.to_i
    when "日"
      day = $2.to_i
    when "点"
      hour = $2.to_i
      hour += 12 if $1 == "下午"
    when "分"
      min = $2.to_i
    when "秒"
      sec = $2.to_i
    end
  end
  return Time.mktime(year, month, day, hour, min, sec)
end

p cparsedate("2010年12月23日下午8点17分50秒")
p cparsedate("12月23日下午8点17分50秒")
p cparsedate("上午8时17分50秒")
p cparsedate("8点17分50秒")

def ls_t(path)
  entries = Dir.entries(path)                # 获取入口
  entries.reject!{|name| /^\./ =~ name }     # 删除文件名以"."开始的文件

  mtimes = Hash.new                          # 边收集mtime边排序
  entries = entries.sort_by do |name|
    mtimes[name] = File.mtime(File.join(path, name))
  end

  entries.each do |name|
    printf("%-40s %s\n", name, mtimes[name]) # 输入文件名以及mtime
  end
rescue => ex
  puts ex.message
end

ls_t(ARGV[0] || ".")

require "date"

module Calendar
  WEEK_TABLE = [
    [99, 99, 99, 99, 99, 99,  1,  2,  3,  4,  5,  6,  7],
    [ 2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14],
    [ 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
    [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28],
    [23, 24, 25, 26, 27, 28, 29, 30, 31, 99, 99, 99, 99],
    [30, 31, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99],
  ]

  module_function

  def cal(year, month)
    first = Date.new(year, month, 1)       # 被指定的月的1号
    end_of_month = ((first >> 1) - 1).day  # 次月的1号的前1天
    start = 6 - first.wday                 # 表示在表格的哪个位置

    puts first.strftime("%B %Y").center(21)
    puts " Su Mo Tu We Th Fr St"
    WEEK_TABLE.each do |week|
      buf = ""
      week[start, 7].each do |day|
        if day > end_of_month
          buf << "   "
        else
          buf << sprintf("%3d", day)
        end
      end
      puts buf
    end
  end
end

t = Date.today
Calendar.cal(t.year, t.month)