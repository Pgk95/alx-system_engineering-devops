#!/usr/bin/env ruby

regex = Regexp.new("hbt{2,1,5}n")
match_data = regex.match(ARGV[0])
if match_data
  puts match_data.to_s
end
