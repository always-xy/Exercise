require "open-uri"

options = {
  "Accept-Language" => "zh-cn, en;q=0.5",
}
open("http://www.ruby-lang.org", options){|io|
  puts io.read
}
