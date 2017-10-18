require "./grep"
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]
simple_grep1(pattern, filename)